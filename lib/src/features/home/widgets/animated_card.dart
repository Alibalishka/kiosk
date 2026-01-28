import 'package:flutter/material.dart';

class AnimatedCard extends StatefulWidget {
  final Widget child;

  const AnimatedCard({super.key, required this.child});

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {
  double scale = 1.0;
  final Duration animationDuration = const Duration(milliseconds: 100);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _animateDown();
      },
      onTapUp: (_) {
        _animateUp();
      },
      onTapCancel: () {
        _animateUp();
      },
      child: AnimatedContainer(
        duration: animationDuration,
        transform: Matrix4.identity()..scale(scale),
        transformAlignment: Alignment.center,
        child: widget.child,
      ),
    );
  }

  void _animateDown() {
    setState(() {
      scale = 0.95; // Уменьшаем размер на 5%
    });
  }

  void _animateUp() {
    setState(() {
      scale = 1.0; // Восстанавливаем исходный размер
    });
  }
}
