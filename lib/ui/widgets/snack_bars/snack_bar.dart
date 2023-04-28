// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:kid_trip/ui/widgets/snack_bars/tap_bounce_container.dart';

OverlayEntry? _previousEntry;

void showTopSnackBar(
    BuildContext context,
    Widget child, {
      Duration showOutAnimationDuration = const Duration(milliseconds: 350),
      Duration hideOutAnimationDuration = const Duration(milliseconds: 550),
      Duration displayDuration = const Duration(milliseconds: 3000),
      double additionalTopPadding = 24.0,
      VoidCallback? onTap,
      OverlayState? overlayState,
      double leftPadding = 16,
      double rightPadding = 16,
    }) async {
  overlayState ??= Overlay.of(context);
  late OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (context) {
      return TopSnackBar(
        child: child,
        onDismissed: () {
          overlayEntry.remove();
          _previousEntry = null;
        },
        showOutAnimationDuration: showOutAnimationDuration,
        hideOutAnimationDuration: hideOutAnimationDuration,
        displayDuration: displayDuration,
        additionalTopPadding: additionalTopPadding,
        onTap: onTap,
        leftPadding: leftPadding,
        rightPadding: rightPadding,
      );
    },
  );

  _previousEntry?.remove();
  overlayState!.insert(overlayEntry);
  _previousEntry = overlayEntry;
}

/// Widget that controls all animations
class TopSnackBar extends StatefulWidget {
  const TopSnackBar({
    Key? key,
    required this.child,
    required this.onDismissed,
    required this.showOutAnimationDuration,
    required this.hideOutAnimationDuration,
    required this.displayDuration,
    required this.additionalTopPadding,
    this.onTap,
    this.leftPadding = 16,
    this.rightPadding = 16,
  }) : super(key: key);

  final additionalTopPadding;
  final Widget child;
  final displayDuration;
  final hideOutAnimationDuration;
  final double leftPadding;
  final VoidCallback onDismissed;
  final VoidCallback? onTap;
  final double rightPadding;
  final showOutAnimationDuration;

  @override
  _TopSnackBarState createState() => _TopSnackBarState();
}

class _TopSnackBarState extends State<TopSnackBar>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation offsetAnimation;
  double? topPosition;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    topPosition = widget.additionalTopPadding;
    _setupAndStartAnimation();
    super.initState();
  }

  void _setupAndStartAnimation() async {
    animationController = AnimationController(
      vsync: this,
      duration: widget.showOutAnimationDuration,
      reverseDuration: widget.hideOutAnimationDuration,
    );

    Tween<Offset> offsetTween = Tween<Offset>(
      begin: Offset(0.0, -1.0),
      end: Offset(0.0, 0.0),
    );

    offsetAnimation = offsetTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOutCirc,
        reverseCurve: Curves.linearToEaseOut,
      ),
    )..addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(widget.displayDuration);
        if (mounted) {
          animationController.reverse();
          setState(() {
            topPosition = 0;
          });
        }
      }

      if (status == AnimationStatus.dismissed) {
        widget.onDismissed.call();
      }
    });

    if (mounted) {
      animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: widget.hideOutAnimationDuration * 1.5,
      curve: Curves.linearToEaseOut,
      top: topPosition,
      left: widget.leftPadding,
      right: widget.rightPadding,
      child: SlideTransition(
        position: offsetAnimation as Animation<Offset>,
        child: SafeArea(
          child: TapBounceContainer(
            onTap: () {
              if (mounted) {
                widget.onTap?.call();
                animationController.reverse();
              }
            },
            child: widget.child,
          ),
        ),
      ),
    );
  }
}


