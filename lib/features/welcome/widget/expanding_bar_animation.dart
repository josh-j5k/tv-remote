// import 'package:android_tv_remote/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ExpandingBarAnimation extends StatefulWidget {
  const ExpandingBarAnimation({super.key});

  @override
  State<ExpandingBarAnimation> createState() => _ExpandingBarAnimationState();
}

class _ExpandingBarAnimationState extends State<ExpandingBarAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  final double startingPoint = 0.2;
  final double maxPoint = 0.65;
  final double midPoint = 0.35;
  final double interval = 30;
  @override
  void initState() {
    super.initState();

    // Animation controller for infinite loop
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Total animation duration
      vsync: this,
    )..repeat(); // Infinite loop

    // TweenSequence to create keyframes
    _widthAnimation = TweenSequence<double>([
      // 0% to 25%: width 0.2 -> 0.7
      TweenSequenceItem(
        tween: Tween<double>(
          begin: startingPoint,
          end: maxPoint,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: interval,
      ),
      // 25% to 50%: width 0.7 -> 0.2
      TweenSequenceItem(
        tween: Tween<double>(
          begin: maxPoint,
          end: startingPoint,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: interval,
      ),
      // 50% to 75%: width 0.2 -> 0.4
      TweenSequenceItem(
        tween: Tween<double>(
          begin: startingPoint,
          end: midPoint,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: interval,
      ),
      // 75% to 100%: width 0.4 -> 0.2
      TweenSequenceItem(
        tween: Tween<double>(
          begin: midPoint,
          end: startingPoint,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: interval,
      ),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _widthAnimation,
        builder: (context, child) {
          return SizedBox(
            height: 2.0,
            width: MediaQuery.of(context).size.width * _widthAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(118, 255, 255, 255),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          );
        },
      ),
    );
  }
}
