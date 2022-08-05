import 'package:flutter/material.dart';
import 'package:portfolio/presentation/widgets/my_habilities_widget.dart';
import 'package:portfolio/utils/extensions.dart';
import 'package:portfolio/utils/utils.dart';

class WhoSection extends StatelessWidget {
  const WhoSection({required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
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
                        ).separatedColumn(10),
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
                                        for (var color in myapps[2].colors)
                                          color
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
                              ).separatedColumn(20)),
                          Container(
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
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ).separatedColumn(20),
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
}
