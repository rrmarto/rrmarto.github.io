import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/presentation/sections/app_section.dart';
import 'package:portfolio/presentation/sections/header_section.dart';
import 'package:portfolio/presentation/sections/menu_section.dart';
import 'package:portfolio/presentation/sections/technologies_section.dart';
import 'package:portfolio/presentation/sections/what_section.dart';
import 'package:portfolio/presentation/sections/where_section.dart';
import 'package:portfolio/presentation/sections/who_section.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:rive/rive.dart' as rive;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double offset = 0;
  double offset1 = 0;
  double offset2 = 0;
  double offsetHeader = 0;
  final Offset _offsetCard = Offset.zero;
  final double _rx = 0.0;
  final double _ry = 0.0;
  bool rotate = false;
  late AnimationController _controller;
  late AnimationController animationController;
  late final List<AnimationController> _list = [];
  late Animation _rotationValue;
  bool animate = false;
  double dx = 0;
  double dy = 0;
  Duration duration = const Duration(seconds: 1);
  bool inMouseRegion = false;
  Map<int, double> sectionsOffset = {};
  List<String> name = "Roberto Marto Ramirez".split("");
  String current = "";
  var height;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _rotationValue = Tween<double>(begin: 0, end: -45)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    for (var i = 0; i < myapps.length; i++) {
      sectionsOffset[i] = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final nameStyle = Theme.of(context).textTheme.headline2;
    final descriptionStyle = Theme.of(context).textTheme.headline4;
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Scaffold(
        key: _scaffoldKey,
        drawer: MenuSection(
          dimensions: sizingInformation,
        ),
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              // const SliverAppBar(
              //   backgroundColor: Colors.black,
              //   elevation: 0,
              //   title: Text("My protfolio"),
              //   floating: true,
              // )
            ];
          },
          body: NotificationListener<ScrollNotification>(
            onNotification: updateOffsetAccordingToScroll,
            child: ScrollConfiguration(
              behavior: NoScrollGlow(),
              child: MouseRegion(
                cursor: inMouseRegion
                    ? SystemMouseCursors.none
                    : SystemMouseCursors.basic,
                onHover: ((event) {
                  setState(() {
                    dx = event.localPosition.dx;
                    dy = event.localPosition.dy;
                  });
                }),
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        HeaderSection(
                            offsetHeader: offsetHeader,
                            dimensions: sizingInformation),
                        WhoSection(
                            color: Colors.black, dimensions: sizingInformation),
                        WhatSection(
                            color: Colors.black, dimensions: sizingInformation),
                        Stack(
                          children: <Widget>[
                            SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  for (int i = 0; i < myapps.length; i++) ...{
                                    TechnologiesSection(
                                        index: i + 1,
                                        colors: myapps[i].colors,
                                        dimensions: sizingInformation,
                                        app: myapps[i]),
                                    AppSection(
                                        app: myapps[i],
                                        offset: sectionsOffset[i]!,
                                        height: height,
                                        width: width,
                                        dimensions: sizingInformation,
                                        isPhone: false),
                                  },
                                  WhereSection(
                                    color: Colors.black,
                                    dimensions: sizingInformation,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    AnimatedPositioned(
                      duration: duration,
                      curve: Curves.decelerate,
                      top: inMouseRegion ? dy : 40,
                      left: inMouseRegion ? dx : 40,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.ease,
                        height: inMouseRegion ? 80 : 50,
                        width: inMouseRegion ? 80 : 50,
                        child: Center(
                          child: inMouseRegion
                              ? const Icon(
                                  Icons.key,
                                  color: Colors.white,
                                  size: 40,
                                )
                              : IconButton(
                                  onPressed: () {
                                    _scaffoldKey.currentState!.openDrawer();
                                  },
                                  icon: const Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                  )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  _transformWidget(String image, int index, {bool fullSize = false}) {
    print(image);
    print(_list.length);

    return Positioned(
      top: (index + 1) * 20 * index + 1,
      right: (index + 1) * 20,
      child: SlideInRight(
        key: Key(index.toString()),
        controller: (controller) => _list.add(controller),
        from: fullSize ? 0 : MediaQuery.of(context).size.width,
        delay: Duration(milliseconds: 200 * index),
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            // ..rotateX((0.3 * (dy / 50) + -0.3))
            ..translate((-0.3 * (dx / 5 * (index + 1)) + 0.3),
                (-0.3 * (dy / 5 * (index + 1)) + 0.3), (-0.3 * (dx / 5) + 0.3)),
          // ..rotateY((-0.3 * (dx / 50) + 0.3)),
          alignment: FractionalOffset.center,
          child: IgnorePointer(
            ignoring: true,
            child: AnimatedOpacity(
              // opacity: offsetHeader < 300 ? 1 : 0,
              opacity: 1,
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                  height: 40 * (index + 1),
                  width: 40 * (index + 1),
                  child: const rive.RiveAnimation.asset(
                    'assets/rive/bubble_demo1.riv',
                  )),
              // child: image.isNotEmpty
              //     ? Image.asset(
              //         "assets/images/$image",
              //         height:
              //             fullSize ? MediaQuery.of(context).size.height * 2 : 700,
              //         width: fullSize
              //             ? MediaQuery.of(context).size.width
              //             : MediaQuery.of(context).size.width / 2 - 100,
              //       )
              //     : const SizedBox(),
            ),
          ),
        ),
      ),
    );
  }

  _transformWidget2(Widget image, int index, {bool fullSize = false}) {
    print(image);
    print(_list.length);

    return SlideInRight(
      key: Key(index.toString()),
      controller: (controller) => _list.add(controller),
      from: fullSize ? 0 : MediaQuery.of(context).size.width,
      delay: Duration(milliseconds: 200 * index),
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          // ..rotateX((0.3 * (dy / 50) + -0.3))
          ..translate((-0.3 * (dx / 5 * (index + 1)) + 0.3),
              (-0.3 * (dy / 5) + 0.3), (-0.3 * (dx / 5) + 0.3)),
        // ..rotateY((-0.3 * (dx / 50) + 0.3)),
        alignment: FractionalOffset.center,
        child: IgnorePointer(
          ignoring: true,
          child: AnimatedOpacity(
            // opacity: offsetHeader < 300 ? 1 : 0,
            opacity: 1,
            duration: const Duration(milliseconds: 500),
            child: widget,
          ),
        ),
      ),
    );
  }

  setMouseRegion(bool hovered) {
    setState(() {
      inMouseRegion = hovered;
    });
  }

  bool updateOffsetAccordingToScroll(ScrollNotification scrollNotification) {
    setState(() {
      offsetHeader = scrollNotification.metrics.pixels;
      offset = scrollNotification.metrics.pixels - height * 2.5;
      // sectionsOffset[0] = offset;
      // print("Offset: $offset");
      // print("Offsetheader: $offsetHeader");
      double foo = 2.5;
      for (var i = 0; i < myapps.length; i++) {
        sectionsOffset[i] = scrollNotification.metrics.pixels - height * foo;
        foo += 2.5;
      }
      offset1 = scrollNotification.metrics.pixels - height * 5;
      // sectionsOffset[1] = offset1;
      offset2 = scrollNotification.metrics.pixels - height * 7.5;
      // sectionsOffset[2] = offset2;

      if ((offsetHeader > height / 3 && offsetHeader < height)
          // ||offsetHeader > height * 1.5 && offsetHeader < height * 2.5
          ) {
        setState(() {
          Future.delayed(const Duration(seconds: 1)).then((value) {
            setState(() {
              duration = const Duration(milliseconds: 1);
            });
          });
          inMouseRegion = true;
        });
      } else {
        setState(() {
          duration = const Duration(seconds: 1);

          inMouseRegion = false;
        });
      }
      if (offsetHeader < 300) {
        setState(() {
          for (var animation in _list) {
            animation.forward();
          }
          // animationController.forward();
        });
      } else {
        setState(() {
          for (var animation in _list) {
            animation.reverse();
          }
        });
      }
    });
    return true;
  }
}

class NoScrollGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}

class My extends ScrollBehavior {}

const kHeroImage = 'assets/images/iphone.png';
