import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/presentation/widgets/cube.dart';

class TestCube extends StatefulWidget {
  final double size;
  const TestCube({Key? key, required this.size}) : super(key: key);

  @override
  State<TestCube> createState() => _TestCubeState();
}

class _TestCubeState extends State<TestCube> {
  Offset _offsetCube = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onPanUpdate: ((details) => setState(() {
              _offsetCube += details.delta;
            })),
        child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(-15)
              ..rotateY(_offsetCube.dx * pi / 180),
            child: CubeTransform(
              size: widget.size,
            )),
      ),
    );
  }
}

class SkewExample extends StatelessWidget {
  const SkewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Stack(
        children: [
          Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..translate(0.0, 100.0, 0.0)
              ..rotateX(-45),
            alignment: Alignment.center,
            child: Container(
              color: Colors.red,
              child: const FlutterLogo(
                size: 200,
              ),
            ),
          ),
          Transform(
            alignment: Alignment.centerLeft,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..translate(0.0, -25.0, 0.0)
              ..rotateY(-45),
            child: Container(
              color: Colors.green,
              child: const FlutterLogo(
                size: 200,
              ),
            ),
          ),
          Transform(
            alignment: Alignment.centerRight,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..translate(0.0, -25.0, 0.0)
              ..rotateY(45),
            child: Container(
              color: Colors.green,
              child: const FlutterLogo(
                size: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
