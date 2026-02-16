import 'package:flutter/material.dart';

class ExpandingBarAnimationSimple extends StatefulWidget {
  const ExpandingBarAnimationSimple({super.key});

  @override
  State<ExpandingBarAnimationSimple> createState() =>
      _ExpandingBarAnimationSimpleState();
}

class _ExpandingBarAnimationSimpleState
    extends State<ExpandingBarAnimationSimple> {
  final List<double> _keyframes = [0.2, 0.7, 0.2, 0.4, 0.2];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _keyframes.length;
        });
        _startAnimation(); // Loop
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        height: 4.0,
        width: MediaQuery.of(context).size.width * _keyframes[_currentIndex],
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}
