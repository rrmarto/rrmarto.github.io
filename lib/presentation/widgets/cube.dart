import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/presentation/atomic_design/foundations/colors.dart';

class CubeTransform extends StatefulWidget {
  final double size;
  const CubeTransform({Key? key, required this.size}) : super(key: key);

  @override
  State<CubeTransform> createState() => _CubeTransformState();
}

class _CubeTransformState extends State<CubeTransform>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  int transparent = 0;
  late double size;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 20), vsync: this);
    animation = Tween(begin: 0.0, end: 360.0)
        .animate(CurvedAnimation(curve: Curves.linear, parent: _controller));
    _controller.forward();
    animation.addListener(() {
      if (animation.value >= 0 && animation.value <= 89) {
        setState(() {
          transparent = 1;
        });
      } else if (animation.value >= 71 && animation.value <= 170) {
        setState(() {
          transparent = 2;
        });
      } else if (animation.value >= 171 && animation.value <= 260) {
        setState(() {
          transparent = 3;
        });
      } else if (animation.value >= 261 && animation.value < 360) {
        setState(() {
          transparent = 4;
        });
      }
      if (mounted) {
        if (animation.isCompleted) {
          _controller.repeat();
        }
      }
    });
    size = widget.size;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _topFace = Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 49, 48, 48),
        // border: Border.all(color: Colors.blue, width: 0.5)
      ),
      child: const Center(
        child: Text(
          "CV",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
    );
    var _bottomFace = Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          // BoxShadow(
          //     blurRadius: 4,
          //     spreadRadius: 4,
          //     color: HexColor.fromHex("12D8FA").withOpacity(0.1)),
          // BoxShadow(
          //     blurRadius: 8,
          //     spreadRadius: 8,
          //     color: HexColor.fromHex("12D8FA").withOpacity(0.2)),
          // BoxShadow(
          //     blurRadius: 12,
          //     spreadRadius: 12,
          //     color: HexColor.fromHex("12D8FA").withOpacity(0.3)),
          // BoxShadow(
          //     blurRadius: 8,
          //     spreadRadius: 8,
          //     color: HexColor.fromHex("12D8FA").withOpacity(0.6)),
          // BoxShadow(
          //     blurRadius: 40,
          //     spreadRadius: 40,
          //     color: HexColor.fromHex("12D8FA").withOpacity(1.0)),
        ],
      ),
    );
    return MouseRegion(
      onEnter: ((event) {
        _controller.stop();
      }),
      onExit: ((event) {
        _controller.forward();
      }),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Se ha descargado su archivo")));
        },
        child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Transform(
                transform: Matrix4.identity()
                  ..rotateY(animation.value * pi / 180),
                alignment: Alignment.center,
                child: SizedBox(
                  height: size,
                  width: size,
                  child: Stack(
                    children: [
                      //bottom shadow
                      Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, -size, 0.0)
                          ..rotateX(-pi / 2),
                        alignment: Alignment.center,
                        child: _bottomFace,
                      ),

                      //parte de abajo
                      Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, -size / 2, 0.0)
                          ..rotateX(-pi / 2),
                        alignment: Alignment.center,
                        child: Container(),
                      ),

                      //cara derecha
                      Transform(
                          transform: Matrix4.identity()
                            ..translate(size / 2, 0.0, 0.0)
                            ..rotateY(-pi / 2),
                          alignment: Alignment.center,
                          child: _cubeFace(4)),

                      //parte de atras
                      Transform(
                          transform: Matrix4.identity()
                            ..translate(0.0, 0.0, -size / 2),
                          child: _cubeFace(3)),

                      //cara izq
                      Transform(
                          transform: Matrix4.identity()
                            ..translate(-size / 2, 0.0, 0.0)
                            ..rotateY(-pi / 2),
                          alignment: Alignment.center,
                          child: _cubeFace(2)),
                      //frente
                      Transform(
                          transform: Matrix4.identity()
                            ..translate(0.0, 0.0, size / 2),
                          child: _cubeFace(1)),

                      //parte arriba
                      Transform(
                          transform: Matrix4.identity()
                            ..translate(0.0, size / 2, 0.0)
                            ..rotateX(pi / 2),
                          alignment: Alignment.center,
                          child: _topFace),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  _cubeFace(int face) {
    return face >= transparent ||
            transparent == 1 ||
            (animation.value >= 280 || animation.value == 0) && face == 1
        ? Container(
            height: size,
            width: size,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    PortfolioColorsFoundation.secondaryBlueColor,
                  ]),
            ),
            child: Center(
              child: RotatedBox(
                  quarterTurns: 2,
                  child: Center(
                    child: Icon(
                      CupertinoIcons.cloud_download,
                      color: Colors.white,
                      size: size - 20,
                    ),
                  )),
            ),
          )
        : SizedBox(
            height: size,
            width: size,
          );
  }
}
