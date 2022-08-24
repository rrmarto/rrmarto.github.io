import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/presentation/providers/offsets_provider.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:provider/provider.dart';

@immutable
class MyHabilitiesWidget extends StatelessWidget {
  final double height;
  const MyHabilitiesWidget({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Habilites(
      distance: height / 2 - 30,
      height: height,
      children: [
        for (var icon in techIcons)
          Center(
            child: Image.asset(
              icon,
              fit: BoxFit.cover,
              height: 50,
              width: 50,
            ),
          )
      ],
    );
  }
}

@immutable
class Habilites extends StatefulWidget {
  const Habilites({
    this.initialOpen,
    required this.distance,
    required this.children,
    required this.height,
  });

  final bool? initialOpen;
  final double distance;
  final List<Widget> children;
  final double height;

  @override
  State<Habilites> createState() => _HabilitesState();
}

class _HabilitesState extends State<Habilites> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final AnimationController _rotationController;

  late final Animation<double> _expandAnimation;
  late final Animation<double> _rotationAnimation;

  bool _open = false;
  bool isHovered = false;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _rotationController = AnimationController(
      duration: const Duration(minutes: 1),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );

    _rotationController.addListener(() {
      if (_rotationController.isCompleted) {
        _rotationController.repeat();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
        _rotationController.forward();
      } else {
        _controller.reverse();
        _rotationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.center,
        children: [
          RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_rotationController),
            child: Stack(children: [
              ..._expandedHabilities(),
            ]),
          ),
          _tapProfile(),
        ],
      ),
    );
  }

  Widget _tapProfile() {
    bool mouseRegion = context.read<OffsetsProvider>().mouseRegion;
    return SizedBox(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MouseRegion(
            onEnter: ((event) {
              if (mouseRegion) {
                _toggle();
              }
            }),
            onExit: (event) {
              if (mouseRegion) {
                _toggle();
              }
            },
            child: InkWell(
              splashColor: Colors.transparent,
              mouseCursor: mouseRegion
                  ? SystemMouseCursors.none
                  : SystemMouseCursors.basic,
              onTap: () {
                if (mouseRegion) {
                  _toggle();
                }
              },
              child: Container(
                height: widget.height - widget.height / 3 - 20,
                width: widget.height - widget.height / 3 - 20,
                decoration: _open
                    ? BoxDecoration(
                        color: Colors.yellow,
                        border: Border.all(color: Colors.yellow, width: 20),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(myInfo.profileImage),
                        ))
                    : BoxDecoration(
                        color: Colors.yellow,
                        border: Border.all(color: Colors.yellow, width: 20),
                        shape: BoxShape.circle,
                      ),
                child: _open
                    ? const SizedBox()
                    : const Center(
                        child: Icon(
                          CupertinoIcons.lock,
                          size: 80,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _expandedHabilities() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 360.0 / (count);
    for (var i = 0, angleInDegrees = 0.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(
        HabilityWidget(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
          height: widget.height,
        ),
      );
    }
    return children;
  }
}

@immutable
class HabilityWidget extends StatelessWidget {
  const HabilityWidget({
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
    required this.height,
  });

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 180.0),
          progress.value * maxDistance,
        );
        return Positioned(
          right: height / 2 - 20 + offset.dx,
          bottom: height / 2 - 20 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * math.pi / 2,
            child: child!,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}
