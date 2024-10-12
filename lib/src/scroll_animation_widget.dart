import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ScrollAnimationWidget extends StatefulWidget {
  final Widget child;
  final Alignment alignment;
  final String index;
  final Duration duration;
  final Curve curve;
  final double visibilityThreshold;
  final bool reverseOnExit;
  final bool enableScale;
  final bool enableRotation;
  final bool loopAnimation;
  final bool alternate;
  final bool enableFade;
  final bool enableSlide;
  final Duration delay;
  final bool resetOnScroll;
  final VoidCallback? onAnimationStart;
  final VoidCallback? onAnimationEnd;

  const ScrollAnimationWidget({
    super.key,
    required this.child,
    required this.alignment,
    required this.index,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOut,
    this.visibilityThreshold = 0.3,
    this.reverseOnExit = true,
    this.enableScale = false,
    this.enableRotation = false,
    this.loopAnimation = false,
    this.alternate = false,
    this.enableFade = true,
    this.enableSlide = true,
    this.delay = Duration.zero,
    this.resetOnScroll = false,
    this.onAnimationStart,
    this.onAnimationEnd,
  });

  @override
  ScrollAnimationWidgetState createState() => ScrollAnimationWidgetState();
}

class ScrollAnimationWidgetState extends State<ScrollAnimationWidget>
    with TickerProviderStateMixin {
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

    if (widget.loopAnimation) {
      _startLooping();
    }
  }

  void _startLooping() {
    if (widget.alternate) {
      _controller.repeat(reverse: true); // Loop with reverse
    } else {
      _controller.repeat(); // Loop continuously
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!mounted) return;

    final isVisible = info.visibleFraction > widget.visibilityThreshold;

    if (isVisible && !_visible) {
      if (!_controller.isAnimating) {
        _controller.forward();
        if (widget.onAnimationStart != null) widget.onAnimationStart!();
      }
      setState(() {
        _visible = true;
        _hasAnimated = true;
      });
    } else if (!isVisible && _hasAnimated && widget.reverseOnExit) {
      if (!_controller.isAnimating) {
        _controller.reverse();
        if (widget.resetOnScroll) {
          _controller.reset();
          setState(() {
            _visible = false;
            _hasAnimated = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget animatedChild = widget.child;

    // Apply scale animation
    if (widget.enableScale) {
      animatedChild = ScaleTransition(
        scale: _fadeAnimation,
        child: animatedChild,
      );
    }

    // Apply rotation animation
    if (widget.enableRotation) {
      animatedChild = RotationTransition(
        turns: _fadeAnimation,
        child: animatedChild,
      );
    }

    // Apply fade and slide animations
    if (widget.enableFade || widget.enableSlide) {
      animatedChild = FadeTransition(
        opacity: widget.enableFade
            ? _fadeAnimation
            : const AlwaysStoppedAnimation(1.0),
        child: SlideTransition(
          position: widget.enableSlide
              ? _slideAnimation
              : const AlwaysStoppedAnimation(Offset.zero),
          child: animatedChild,
        ),
      );
    }

    return VisibilityDetector(
      key: Key(widget.index),
      onVisibilityChanged: _onVisibilityChanged,
      child: animatedChild,
    );
  }
}
