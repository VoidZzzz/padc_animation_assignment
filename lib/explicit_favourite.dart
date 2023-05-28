import 'package:flutter/material.dart';

const kAnimationDuration = Duration(milliseconds: 1000);

class ExplicitFavourite extends StatefulWidget {
  const ExplicitFavourite({super.key});

  @override
  State<ExplicitFavourite> createState() => _ExplicitFavouriteState();
}

class _ExplicitFavouriteState extends State<ExplicitFavourite>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  bool isAnimationComplete = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: kAnimationDuration,
      upperBound: 1,
    );
    _colorAnimation = ColorTween(
      begin: Colors.grey[500],
      end: Colors.red,
    ).animate(_controller.view);

    _controller.addStatusListener((status) {
      isAnimationComplete = (status == AnimationStatus.completed);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 48,
        right: 10,
      ),
      child: AnimatedBuilder(
        animation: _controller.view,
        builder: (context, _) => RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
          child: IconButton(
            onPressed: () {
              isAnimationComplete
                  ? _controller.reverse()
                  : _controller.forward();
            },
            icon: Icon(
              Icons.favorite,
              color: _colorAnimation.value,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}