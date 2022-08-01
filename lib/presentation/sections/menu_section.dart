import 'package:flutter/material.dart';
import 'package:portfolio/presentation/sections/header_section.dart';
import 'package:portfolio/presentation/sections/what_section.dart';
import 'package:portfolio/presentation/sections/where_section.dart';
import 'package:portfolio/presentation/sections/who_section.dart';
import 'package:portfolio/test_cube.dart';
import 'package:portfolio/utils/enums.dart';
import 'package:portfolio/utils/extensions.dart';
import 'package:portfolio/utils/fade_out.dart';
import 'package:portfolio/utils/utils.dart';

class MenuSection extends StatefulWidget {
  const MenuSection({Key? key}) : super(key: key);

  @override
  State<MenuSection> createState() => _MenuSectionState();
}

class _MenuSectionState extends State<MenuSection>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _zoomController;

  List<String> strings = ['WHO', 'WHAT', 'HOW', 'ABOUT'];
  List<String> images = [
    'landscape.jpg',
    'coding.jpg',
    'landscape2.jpg',
    'landscape.jpg'
  ];
  Sections section = Sections.initial;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _zoomController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    // _animationController.reverse();

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            IgnorePointer(
              ignoring: true,
              child: FadeOut(
                  duration: const Duration(milliseconds: 300),
                  controller: (controller) => _animationController = controller,
                  manualTrigger: true,
                  child: Opacity(
                    opacity: 0.1,
                    child: SizedBox(
                      height: height,
                      width: width,
                      // decoration: const BoxDecoration(
                      //     image: DecorationImage(
                      //         fit: BoxFit.cover,
                      //         // colorFilter: ColorFilter.mode(
                      //         //     Colors.blue.withOpacity(0.3), BlendMode.dstIn),
                      //         image: AssetImage(
                      //           "assets/images/landscape.jpg",
                      //         ))),
                      child: selectedSection(),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: SizedBox(
                  // width: width / 3,
                  child: AnimatedBuilder(
                animation: _animationController,
                builder: ((context, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (var text in Sections.values)
                        if (text != Sections.initial) _sectionWidget(text),
                    ],
                  ).fit();
                }),
              )),
            ),
            Positioned(
                bottom: 60,
                // left: 0,
                right: 20,
                child: _infoFooter(width)),
            Positioned(
                right: 20,
                top: 40,
                child: InkWell(
                  onTap: (() => Navigator.pop(context)),
                  child: const Icon(
                    Icons.cancel_outlined,
                    color: Colors.white,
                    size: 60,
                  ).shaderOnWidget(const LinearGradient(colors: [
                    Colors.blue,
                    Color.fromARGB(255, 205, 255, 231)
                  ])),
                ))
          ],
        ),
      ),
    );
  }

  Widget _infoFooter(double width) {
    return SizedBox(
      width: width / 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TestCube(size: 100),
          const SizedBox(
            height: 20,
          ),
          const FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "2022",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 300),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width / 8 - 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Created by",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Roberto Marto Ramirez",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: width / 8 - 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      "Contact",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "rrmarto89@gmail.com",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var contact in contacts)
                Image.asset(
                  "assets/images/contact/$contact",
                  height: 30,
                  width: 30,
                ),
            ],
          ),
        ],
      ),
    ).shaderOnWidget(const LinearGradient(
        colors: [Colors.blue, Color.fromARGB(255, 205, 255, 231)]));
  }

  Widget _sectionWidget(Sections text) {
    bool current = section == text;
    return MouseRegion(
      onExit: (e) {
        setState(() {
          _animationController.forward();
        });
      },
      onEnter: (e) {
        setState(() {
          Future.delayed(const Duration(milliseconds: 300)).then((value) => {
                _animationController.reverse(),
                setState(() {
                  section = text;
                })
              });
        });
      },
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(0),
        child: Text(
          text.name.toUpperCase(),
          style: const TextStyle(
              color: Colors.yellow,
              // fontWeight: FontWeight.bold,
              fontFamily: 'Ways',
              fontSize: 200),
        ),
      ),
    );
  }

  selectedSection() {
    switch (section) {
      case Sections.initial:
        return const SizedBox();
      case Sections.home:
        return const HeaderSection(
          offsetHeader: 0,
        );
      case Sections.who:
        return WhoSection(
          color: Colors.black,
        );
      case Sections.what:
        return const WhatSection(color: Colors.black);
      case Sections.where:
        return const WhereSection(color: Colors.black);
      default:
    }
  }
}
