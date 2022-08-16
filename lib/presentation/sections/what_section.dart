import 'package:flutter/material.dart';
import 'package:portfolio/presentation/atomic_design/foundations/texts.dart';
import 'package:portfolio/utils/extensions.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WhatSection extends StatelessWidget {
  final Color color;
  final SizingInformation dimensions;
  const WhatSection({
    Key? key,
    required this.color,
    required this.dimensions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SizedBox(
      // color: color,
      height: height,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: height / 3,
          ),
          // Text(
          //   'Mi nombres',
          //   style: descriptionStyle!.copyWith(color: Colors.white),
          // ),
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 8),
                child: const Center(
                  child: Text(
                    PortfolioTextsFoundation.selectedAppsText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // const SizedBox(height: 20),
        ],
      ),
    );
  }
}
