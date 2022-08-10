import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/presentation/widgets/my_habilities_widget.dart';
import 'package:portfolio/utils/extensions.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WhoSection extends StatelessWidget {
  WhoSection({required this.color, required this.dimensions});
  final Color color;
  final SizingInformation dimensions;
  late double width;
  final PageController _pageViewController = PageController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return dimensions.isDesktop
        ? _desktop(height, context)
        : _mobile(height, context);
  }

  SizedBox _desktop(double height, BuildContext context) {
    return SizedBox(
      // color: color,
      height: height,
      child: Align(
          alignment: const Alignment(0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Text(
              //   'Mi nombres',
              //   style: descriptionStyle!.copyWith(color: Colors.white),
              // ),
              SizedBox(
                // color: Colors.black,
                height: height / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(
                      "Wh".toUpperCase(),
                      style: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 300,
                          fontWeight: FontWeight.bold),
                    )),
                    SizedBox(
                      height: height / 2,
                      width: height / 2,
                      child: Center(
                          child: MyHabilitiesWidget(
                        height: height / 2,
                      )),
                    ),
                    Stack(
                      children: [
                        Text(
                          "?".toUpperCase(),
                          style: const TextStyle(
                              color: Colors.yellow,
                              fontSize: 300,
                              fontFamily: 'Agne',
                              fontWeight: FontWeight.bold),
                        ),
                        // const Positioned(
                        //   bottom: 40,
                        //   left: 0,
                        //   right: 0,
                        //   child: SizedBox(
                        //     height: 100,
                        //     width: 100,
                        //     child: rive.RiveAnimation.asset(
                        //       'assets/rive/bubble_demo.riv',
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: height / 2 - 20,
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: height / 2 - 40,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            // color: Colors.blue,
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  for (var color in myapps[3].colors) color
                                ]),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            const Text('Summary',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                myInfo['summary']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ).separatedColumn(10).fit(),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            height: height / 4 - 30,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                // color: Colors.indigoAccent,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      for (var color in myapps[2].colors) color
                                    ]),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                const Center(
                                  child: Text('Skills & Technologies',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Text(
                                  myInfo['skills']!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ).separatedColumn(20).fit(),
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(10),
                            height: height / 4 - 30,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      for (var color in myapps[1].colors) color
                                    ]),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                const Center(
                                  child: Text('Postgrades',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Text(
                                  myInfo['training']!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ).separatedColumn(20).fit(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     for (int i = 0; i < 3; i++)
              //       Container(
              //         height: height / 4,
              //         width: MediaQuery.of(context).size.width / 3 - 20,
              //         decoration: const BoxDecoration(color: Colors.yellow),
              //       )
              //   ],
              // ),
              const SizedBox(height: 20),
            ],
          )),
    );
  }

  _mobile(double height, BuildContext context) {
    return SizedBox(
      // color: color,
      height: height,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Text(
          //   'Mi nombres',
          //   style: descriptionStyle!.copyWith(color: Colors.white),
          // ),
          SizedBox(
            // color: Colors.black,
            // height: height / 4,
            width: width - 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   width: width,
                // ),
                Text(
                  "Wh".toUpperCase(),
                  style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 300,
                      fontWeight: FontWeight.bold),
                ),
                // Container(
                //   height: width / 3,
                //   width: width / 3,
                //   decoration: const BoxDecoration(
                //       shape: BoxShape.circle, color: Colors.yellow),
                // ),
                _habilitiesWidget(height),
                Text(
                  "?".toUpperCase(),
                  style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 300,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ).fit(),
          ),
          SizedBox(
            height: height / 5,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: height / 2,
            child: Stack(
              children: [
                PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageViewController,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: height / 2 - 40,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          // color: Colors.blue,
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                for (var color in myapps[3].colors) color
                              ]),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          const Text('Summary',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              myInfo['summary']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ).separatedColumn(10).fit(),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: height / 2 - 40,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          // color: Colors.indigoAccent,
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                for (var color in myapps[2].colors) color
                              ]),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          const Center(
                            child: Text('Skills & Technologies',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              myInfo['skills']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ).separatedColumn(20).fit(),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: height / 2 - 40,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                for (var color in myapps[1].colors) color
                              ]),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          const Center(
                            child: Text('Postgrades',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              myInfo['training']!,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ).separatedColumn(20).fit(),
                    )
                  ],
                ),
                Positioned(
                    bottom: 0,
                    top: 0,
                    left: 20,
                    child: IconButton(
                        onPressed: () {
                          if (_pageViewController.page!.toInt() > 0) {
                            _pageViewController.previousPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.ease);
                          }
                        },
                        icon: const Icon(
                          CupertinoIcons.chevron_left_circle,
                          size: 50,
                          color: Colors.white,
                        ))),
                Positioned(
                    bottom: 0,
                    top: 0,
                    right: 20,
                    child: IconButton(
                        onPressed: () {
                          if (_pageViewController.page!.toInt() < 2) {
                            _pageViewController.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.ease);
                          }
                        },
                        icon: const Icon(
                          CupertinoIcons.chevron_right_circle,
                          size: 50,
                          color: Colors.white,
                        ))),
              ],
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     for (int i = 0; i < 3; i++)
          //       Container(
          //         height: height / 4,
          //         width: MediaQuery.of(context).size.width / 3 - 20,
          //         decoration: const BoxDecoration(color: Colors.yellow),
          //       )
          //   ],
          // ),
        ],
      ),
    );
  }

  SizedBox _habilitiesWidget(double height) {
    return SizedBox(
      height: height / 2,
      width: height / 2,
      child: Center(
          child: MyHabilitiesWidget(
        height: height / 2,
      )),
    );
  }
}
