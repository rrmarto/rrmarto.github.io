import 'package:flutter/material.dart';

class WhatSection extends StatelessWidget {
  final Color color;
  const WhatSection(
      {Key? key,
      required this.color,})
      : super(key: key);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    "What?".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 300,
                        fontWeight: FontWeight.bold),
                  )),
                ],
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Text(
                    """I've create applications for both Android and iOS using Flutter.
                     Working as a freelancer and working for companies like Newmont and ENTV USA. 
                     Next I'll show you some of the apps that are published in the stores.
""",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          )),
    );
  }
}
