import 'package:flutter/material.dart';
import 'package:portfolio/utils/extensions.dart';
import 'package:portfolio/utils/zoom_widget_out.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeaderSection extends StatelessWidget {
  final double offsetHeader;
  final SizingInformation dimensions;
  const HeaderSection(
      {Key? key, required this.offsetHeader, required this.dimensions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      // color: Colors.black,
      decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     stops: [0.5, 1.0],
          //     colors: [Colors.black, Colors.black]
          //     )
          ),
      child: SizedBox(
        // constraints: BoxConstraints(maxHeight: height),
        // decoration: BoxDecoration(
        //     color: Colors.black,
        //     image: DecorationImage(
        //         fit: BoxFit.cover,
        //         image: AssetImage("assets/images/coding.JPG"))),
        height: height,
        child: Stack(
          children: [
            Positioned(
              top: 40,
              left: width / 10,
              right: width / 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      width: width - width / 3,
                      height: height - height / 3,
                      child: AnimatedOpacity(
                        opacity: offsetHeader < height / 2 ? 1 : 0,
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          "Roberto\nMarto\nRamirez".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 200,
                              fontFamily: 'Ways',
                              // fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                            .shaderOnWidget(const LinearGradient(colors: [
                              Colors.blue,
                              Color.fromARGB(255, 205, 255, 231)
                            ]))
                            .fit(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                    // child: Divider(
                    //   color: Colors.white,
                    // ),
                  ),
                  Center(
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 700),
                      opacity: offsetHeader < height / 2 ? 1 : 0,
                      child: SizedBox(
                        width: width - width / 3,
                        height: height / 6,
                        child: const Text(
                          "Mobile developer / Software Developer",
                          style: TextStyle(
                              fontSize: 50,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                            .shaderOnWidget(const LinearGradient(colors: [
                              Colors.blue,
                              Color.fromARGB(255, 205, 255, 231)
                            ]))
                            .fit(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                top: getValueForScreenType<double>(
                  context: context,
                  mobile: height / 2.5,
                  tablet: height / 3,
                  desktop: 170,
                ),
                left: width / 8,
                child: ZoomWidgetOut(
                  from: 10,
                  delay: const Duration(seconds: 1),
                  child: Transform.rotate(
                    angle: 0.3,
                    child: Container(
                      padding: EdgeInsets.all(getValueForScreenType<double>(
                        context: context,
                        mobile: 2,
                        tablet: 20,
                        desktop: 20,
                      )),
                      height: width / 8,
                      width: getValueForScreenType<double>(
                        context: context,
                        mobile: width / 2,
                        tablet: width / 4,
                        desktop: width / 4,
                      ),
                      // width: height / 2,
                      decoration: BoxDecoration(
                          // color: Colors.yellow,
                          border: Border.all(
                              color: Colors.yellow,
                              width: getValueForScreenType<double>(
                                context: context,
                                mobile: 5,
                                tablet: 15,
                                desktop: 15,
                              )),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Portfolio",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: getValueForScreenType<double>(
                                context: context,
                                mobile: 20,
                                tablet: 20,
                                desktop: 60,
                              ),
                              fontFamily: 'Ways'),
                        ).fit(),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
