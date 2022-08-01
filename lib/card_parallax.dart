import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class CardParallax extends StatefulWidget {
  double width, height;
  String image;
  CardParallax(
      {Key? key,
      required this.width,
      required this.height,
      required this.image})
      : super(key: key);
  @override
  _CardParallaxState createState() => _CardParallaxState();
}

class _CardParallaxState extends State<CardParallax> {
  double localX = 0;
  double localY = 0;
  bool defaultPosition = true;
  List<double>? _gyroscopeValues;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gyroscopeEvents.listen(
      (GyroscopeEvent event) {
        if (mounted) {
          setState(() {
            _gyroscopeValues = <double>[event.x, event.y, event.z];
            print(_gyroscopeValues);
            // if (mounted) setState(() => defaultPosition = false);
            // if (event.x > 0 && event.y < widget.height) {
            //   if (event.x < widget.width - 40 && event.y > 0) {
            //     localX = event.x;
            //     localY = event.y;
            //   }
            // }
            if (mounted) setState(() => defaultPosition = false);
            if (event.x > 0 && event.y < widget.height) {
              if (event.x < widget.width && event.y > 0) {
                localX = event.x;
                localY = event.y;
              }
            }
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double percentageX = (localX / (widget.width - 40)) * 100;
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
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 50),
                color: Color.fromARGB(120, 0, 0, 0),
                blurRadius: 22,
                spreadRadius: -20),
          ],
        ),
        // child: GestureDetector(
        //   onPanCancel: () => setState(() => defaultPosition = true),
        //   onPanDown: (_) => setState(() => defaultPosition = false),
        //   onPanEnd: (_) => setState(() {
        //     localY = 115;
        //     localX = (size.width - 40) / 2;
        //     defaultPosition = true;
        //   }),
        //   onPanUpdate: (details) {
        //     if (mounted) setState(() => defaultPosition = false);
        //     if (details.localPosition.dx > 0 &&
        //         details.localPosition.dy < 230) {
        //       if (details.localPosition.dx < size.width - 40 &&
        //           details.localPosition.dy > 0) {
        //         localX = details.localPosition.dx;
        //         localY = details.localPosition.dy;
        //       }
        //     }
        //   },

        child: MouseRegion(
          // onPanCancel: () => setState(() => defaultPosition = true),
          // onEnter: (_) => setState(() => defaultPosition = false),
          onExit: (_) => setState(() {
            localY = 0;
            localX = 0;
            defaultPosition = true;
          }),
          onHover: (details) {
            //? work on this
            // if (details.localPosition.dy >= widget.height - 15 ||
            //     details.localPosition.dy <= 15 ||
            //     details.localPosition.dx >= widget.width - 15 ||
            //     details.localPosition.dx <= 10) {
            //   setState(() {
            //     localX = 15;
            //     localY = 15;
            //     // defaultPosition = true;
            //   });
            // } else {
            // if (details.localPosition.dy >= widget.height - 15 ||
            //     details.localPosition.dy <= 15 ||
            //     details.localPosition.dx >= widget.width - 15 ||
            //     details.localPosition.dx <= 10) {}
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
              borderRadius: BorderRadius.circular(25),
              color: Colors.black,
              border: const Border.fromBorderSide(
                  BorderSide(color: Colors.black, width: 6)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
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
                        'assets/images/${widget.image}',
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
//                   Transform(
//                     transform: Matrix4.identity()
//                       ..translate(
//                           defaultPosition
//                               ? 0.0
//                               : (15 * (percentageX / 50) + -15),
//                           defaultPosition
//                               ? 0.0
//                               : (15 * (percentageY / 50) + -15),
//                           0.0),
//                     alignment: FractionalOffset.center,
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 22),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           /** AQUII */

//                           // Align(
//                           //   alignment: Alignment.centerLeft,
//                           //   child: Padding(
//                           //     padding: const EdgeInsets.only(left: 22, top: 15),
//                           //     child: Container(
//                           //       // decoration: BoxDecoration(
//                           //       //   boxShadow: [
//                           //       //     BoxShadow(
//                           //       //         offset: Offset(0, 10),
//                           //       //         color: Colors.white.withOpacity(0.4),
//                           //       //         blurRadius: 5,
//                           //       //         spreadRadius: 5),
//                           //       //   ],
//                           //       // ),
//                           //       padding: const EdgeInsets.only(top: 5),
//                           //       child: Image.asset("assets/images/coding.JPG",
//                           //           width: 90),
//                           //     ),
//                           //   ),
//                           // ),
// //                           Expanded(child: Container()),
// //                           Text(
// //                             '5048 3817 4921 8497',
// //                             style: TextStyle(
// //                               fontFamily: "CreditCard",
// //                               color: Colors.white.withOpacity(0.9),
// //                               fontSize: 18,
// // //                                        GRADIENT TEXT
// // //                                        foreground: Paint()
// // //                                          ..shader = LinearGradient(
// // //                                                  colors: [Colors.grey[700], Colors.white],
// // //                                                  begin: Alignment.topCenter,
// // //                                                  end: Alignment.bottomCenter,
// // //                                                  tileMode: TileMode.repeated)
// // //                                              .createShader(Rect.fromLTWH(0.0, 9.0, 0.0, 18.0)),
// //                             ),
// //                           ),
// //                           SizedBox(height: 10),
// //                           Row(
// //                             children: [
// //                               // Expanded(child: Container()),
// //                               Text(
// //                                 'THRU 09/22',
// //                                 style: TextStyle(
// //                                     fontFamily: "CreditCard",
// //                                     color: Colors.black.withOpacity(0.8),
// //                                     fontSize: 12),
// //                               ),
// //                             ],
// //                           ),
//                           SizedBox(height: 20),
//                         ],
//                       ),
//                     ),
//                   )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
