import 'package:flutter/material.dart';
import 'package:portfolio/utils/extensions.dart';

class TechnologiesSection extends StatelessWidget {
  final String app;
  final int index;
  final List<Color> colors;
  const TechnologiesSection(
      {required this.app, Key? key, required this.index, required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
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
            child: Container(
              height: height / 3 - 40,
              width: height / 3 - 40,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  // gradient: LinearGradient(
                  //     // colors: [HexColor.fromHex("12D8FA"), Colors.blueAccent]
                  //     colors: [for (var color in colors.reversed) color]),
                  shape: BoxShape.circle),
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
                    ),
                  ),
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
                    app.toUpperCase(),
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
