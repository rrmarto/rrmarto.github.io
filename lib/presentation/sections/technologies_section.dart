import 'package:flutter/material.dart';
import 'package:portfolio/domain/entities/apps_model.dart';
import 'package:portfolio/utils/extensions.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TechnologiesSection extends StatelessWidget {
  final AppsModel app;
  final int index;
  final List<Color> colors;
  final SizingInformation dimensions;
  TechnologiesSection(
      {required this.app,
      Key? key,
      required this.index,
      required this.colors,
      required this.dimensions})
      : super(key: key);
  late double height;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return !dimensions.isMobile ? _desktop(height, context) : _mobile();
  }

  _mobile() {
    return Container(
      padding: const EdgeInsets.all(20),
      height: height / 2,

      // width: width / 2 ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      spreadRadius: 20,
                      blurRadius: 20,
                      color: Colors.black12,
                      offset: Offset(30, 30))
                ],
                // border: Border.all(color: Colors.white, width: 10)
                color: app.colors[0]),
            child: Column(
              children: [
                Center(
                    child: Text(
                  app.name.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )),

                // DefaultTextStyle(
                //   style: TextStyle(
                //       fontSize: isPhone ? 20 : 30,
                //       fontFamily: 'Agne',
                //       color: Colors.white),
                //   child: AnimatedTextKit(
                //     pause: const Duration(milliseconds: 4000),
                //     animatedTexts: [
                //       TypewriterAnimatedText(
                //           """Esta aplicación se realizó con el objetivo de controlar los sitemas privados de la empresa. La misma se realizo usando el framework flutter ademas de otras teccnologias""" *
                //               5),
                //       // TypewriterAnimatedText('Design first, then code'),
                //       // TypewriterAnimatedText(
                //       //     'Do not patch bugs out, rewrite them'),
                //       // TypewriterAnimatedText(
                //       //     'Do not test bugs out, design them out'),
                //     ],
                //     onTap: () {
                //       print("Tap Event");
                //     },
                //   ),
                // ),
                // Text(
                //   "Aplicación de control de accesos".toUpperCase(),
                //   style: TextStyle(
                //       fontSize: isPhone ? 20 : 30,
                //       fontFamily: 'Agne',
                //       color: Colors.white),
                // ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      spreadRadius: 20,
                      blurRadius: 20,
                      color: Colors.black12,
                      offset: Offset(30, 30))
                ],
                // border: Border.all(color: Colors.white, width: 10),
                color: app.colors[1]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  """Esta aplicación se realizó con el objetivo de controlar los sitemas privados de la empresa. La misma se realizo usando el framework flutter ademas de otras teccnologias""" *
                      3,
                  style: const TextStyle(color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Icon(
                        Icons.apple,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Icon(
                        Icons.android,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ).separatedColumn(10),
          )
        ],
      ).separatedColumn(20, alignment: MainAxisAlignment.center),
    );
  }

  Container _desktop(double height, BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: index == 1 ? Colors.transparent : Colors.black,
        // image: DecorationImage(
        //     fit: BoxFit.cover, image: AssetImage("assets/images/blackbg.jpeg")),
      ),
      height: height / 2,
      child: Stack(
        children: [
          // Positioned(
          //   right: -height / 7,
          //   child: SizedBox(
          //     height: height / 2,
          //     width: height / 2,
          //     child: const RiveAnimation.asset(
          //       'assets/rive/bubble_demo.riv',
          //     ),
          //   ),
          // ),
          Positioned(
            left: 10,
            bottom: 0, top: 0,
            // bottom: -height / 7,
            child: Center(
              child: Container(
                height: height / 3 - 20,
                width: height / 3 - 20,
                decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //       offset: const Offset(0, 0),
                    //       color: colors[0].withOpacity(0.5),
                    //       blurRadius: 5,
                    //       spreadRadius: 10)
                    // ],
                    gradient: LinearGradient(
                        // colors: [HexColor.fromHex("12D8FA"), Colors.blueAccent]
                        colors: [for (var color in colors) color]),
                    shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    "0$index",
                    style: const TextStyle(
                      fontSize: 150,
                      color: Colors.white,
                      fontFamily: 'Ways',
                    ),
                  ).fit(),
                ),
              ),
            ),
          ),
          // Positioned(
          //     right: 0,
          //     bottom: 0,
          //     child: Image.asset(
          //       "assets/images/download.png",
          //       width: height / 2,
          //     )),
          Positioned(
            top: 0,
            bottom: 0,
            left: MediaQuery.of(context).size.height / 3 - 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Container(
                //   height: 5,
                //   width: MediaQuery.of(context).size.width / 2,
                //   decoration: const BoxDecoration(
                //       color: Color.fromARGB(255, 214, 255, 235),
                //       boxShadow: [
                //         BoxShadow(
                //             spreadRadius: 5,
                //             blurRadius: 5,
                //             color: Colors.greenAccent)
                //       ]),
                // ),
                const Text(
                  "Technologies Used",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'Ways',
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - height / 3,
                  child: Text(
                    app.technologies.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Ways',
                    ).borderPaint(50, Colors.white),
                  ),
                ),
              ],
            ).separatedColumn(40),
          ),
        ],
      ),
    );
  }
}
