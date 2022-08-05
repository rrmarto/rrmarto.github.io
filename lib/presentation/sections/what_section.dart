import 'package:flutter/material.dart';
import 'package:portfolio/utils/extensions.dart';

class WhatSection extends StatelessWidget {
  final Color color;
  const WhatSection({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SizedBox(
      // color: color,
      height: height,
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
                  child: SizedBox(
                // height: height,
                width: width - width / 3,
                child: Text(
                  "What?".toUpperCase(),
                  style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 300,
                      fontWeight: FontWeight.bold),
                ).fit(),
              )),
            ],
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 40),
              // decoration: BoxDecoration(
              //     // color: Colors.indigoAccent,
              //     gradient: LinearGradient(
              //         begin: Alignment.topCenter,
              //         end: Alignment.bottomCenter,
              //         colors: [for (var color in myapps[2].colors) color]),
              //     borderRadius: BorderRadius.circular(20)),
              child: const Center(
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
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
