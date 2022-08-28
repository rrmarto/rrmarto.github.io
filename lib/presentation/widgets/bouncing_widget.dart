import 'package:flutter/material.dart';

class BouncingWidget extends StatefulWidget {
  final Widget child;
  const BouncingWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<BouncingWidget> createState() => _BouncingWidgetState();
}

class _BouncingWidgetState extends State<BouncingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = Tween(begin: 0.2, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.elasticOut));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Transform.scale(
            scale: _animation.value,
            child: widget.child,
          );
        });
  }
}
