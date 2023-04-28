import 'package:flutter/material.dart';

/// Widget for nice tap effect. It decrease widget scale while tapping
class TapBounceContainer extends StatefulWidget {
  const TapBounceContainer({
    Key? key,
    required this.child,
    this.onTap,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onTap;

  @override
  _TapBounceContainerState createState() => _TapBounceContainerState();
}

class _TapBounceContainerState extends State<TapBounceContainer>
    with SingleTickerProviderStateMixin {
  final animationDuration = Duration(milliseconds: 200);

  late AnimationController _controller;
  late double _scale;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: animationDuration,
      lowerBound: 0.0,
      upperBound: 0.04,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void _onTapDown(TapDownDetails details) {
    if (mounted) {
      _controller.forward();
    }
  }

  void _onTapUp(TapUpDetails details) async {
    await _closeSnackBar();
  }

  void _onPanEnd(DragEndDetails details) async {
    await _closeSnackBar();
  }

  Future _closeSnackBar() async {
    if (mounted) {
      _controller.reverse();
      await Future.delayed(animationDuration);
      widget.onTap?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onPanEnd: _onPanEnd,
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}
