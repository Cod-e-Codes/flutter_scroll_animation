import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ScrollAnimationWidget extends StatefulWidget {
  final Widget child;
  final Alignment alignment;
  final String index;
  final Duration duration;
  final Curve curve;

  const ScrollAnimationWidget({
    super.key,
    required this.child,
    required this.alignment,
    required this.index,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOut,
  });

  @override
  ScrollAnimationWidgetState createState() => ScrollAnimationWidgetState();
}

class ScrollAnimationWidgetState extends State<ScrollAnimationWidget> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  bool _visible = false;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _slideAnimation = Tween<Offset>(
      begin: widget.alignment == Alignment.centerRight
          ? const Offset(1.0, 0.0)
          : const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: widget.curve));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!mounted) return;

    if (info.visibleFraction > 0.3 && !_visible) {
      if (!_hasAnimated) {
        _controller.forward();
        _hasAnimated = true;
      }
      if (mounted) {
        setState(() {
          _visible = true;
        });
      }
    } else if (info.visibleFraction == 0.0 && _hasAnimated) {
      if (mounted) {
        _controller.reverse();
      }
      if (mounted) {
        setState(() {
          _visible = false;
          _hasAnimated = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.index),
      onVisibilityChanged: _onVisibilityChanged,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: widget.child,
        ),
      ),
    );
  }
}
