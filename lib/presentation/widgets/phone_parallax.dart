import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PhoneParallax extends StatefulWidget {
  final double width, height;
  final String image;
  const PhoneParallax(
      {Key? key,
      required this.width,
      required this.height,
      required this.image})
      : super(key: key);
  @override
  _PhoneParallaxState createState() => _PhoneParallaxState();
}

class _PhoneParallaxState extends State<PhoneParallax> {
  double localX = 0;
  double localY = 0;
  bool defaultPosition = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double percentageX = (localX / (widget.width)) * 100;
    double percentageY = (localY / widget.height) * 100;
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(defaultPosition ? 0 : (0.3 * (percentageY / 50) + -0.3))
        ..rotateY(defaultPosition ? 0 : (-0.3 * (percentageX / 50) + 0.3)),
      alignment: FractionalOffset.center,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(getValueForScreenType<double>(
            context: context,
            mobile: 15,
            tablet: 15,
            desktop: 20,
          )),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 50),
                color: Color.fromARGB(120, 0, 0, 0),
                blurRadius: 22,
                spreadRadius: -20),
          ],
        ),
        child: MouseRegion(
          onExit: (_) => setState(() {
            localY = 0;
            localX = 0;
            defaultPosition = true;
          }),
          onHover: (details) {
            if (mounted) setState(() => defaultPosition = false);
            if (details.localPosition.dx > 0 &&
                details.localPosition.dy < widget.height) {
              if (details.localPosition.dx < widget.width &&
                  details.localPosition.dy > 0) {
                localX = details.localPosition.dx;
                localY = details.localPosition.dy;
              }
            }
            // }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(getValueForScreenType<double>(
                context: context,
                mobile: 15,
                tablet: 15,
                desktop: 20,
              )),
              color: Colors.black,
              border: Border.fromBorderSide(BorderSide(
                  color: Colors.black,
                  width: getValueForScreenType<double>(
                    context: context,
                    mobile: 4,
                    tablet: 4,
                    desktop: 6,
                  ))),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(getValueForScreenType<double>(
                context: context,
                mobile: 15,
                tablet: 15,
                desktop: 20,
              )),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Transform(
                    transform: Matrix4.identity()
                      ..translate(
                          defaultPosition ? 0.0 : (8 * (percentageX / 50) + -8),
                          defaultPosition ? 0.0 : (8 * (percentageY / 50) + -8),
                          0.0),
                    alignment: FractionalOffset.center,
                    child: Opacity(
                      opacity: 1,
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Transform(
                        transform: Matrix4.translationValues(
                          (widget.width - 90) - localX,
                          (widget.height - 50) - localY,
                          0.0,
                        ),
                        child: AnimatedOpacity(
                          opacity: defaultPosition ? 0 : 1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.decelerate,
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.4),
                                blurRadius: 100,
                                spreadRadius: 40,
                              )
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
