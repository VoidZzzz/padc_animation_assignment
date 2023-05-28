import 'package:flutter/material.dart';

const kAnimationDuration = Duration(milliseconds: 1000);
class ExplicitCollapseExpand extends StatefulWidget {
  final Function onTap;
  const ExplicitCollapseExpand({super.key, required this.onTap});

  @override
  State<ExplicitCollapseExpand> createState() => _ExplicitCollapseExpandState();
}

class _ExplicitCollapseExpandState extends State<ExplicitCollapseExpand> with TickerProviderStateMixin{

  late AnimationController _controller;
  bool isExpand = true;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: kAnimationDuration,
      upperBound: 0.5,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
      child: IconButton(
        onPressed: () {
          widget.onTap();
          setState(() {
            if (isExpand) {
              _controller.reverse(from: 0.5);
            } else {
              _controller.forward(from: 0.0);
            }
            isExpand = !isExpand;
          });
        },
        icon: const Icon(
          Icons.keyboard_arrow_down_sharp,
          size: 30,
        ),
      ),
    );
  }
}