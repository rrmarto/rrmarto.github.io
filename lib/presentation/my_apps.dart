import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/presentation/sections/app_section.dart';
import 'package:portfolio/presentation/sections/header_section.dart';
import 'package:portfolio/presentation/sections/menu_section.dart';
import 'package:portfolio/presentation/sections/technologies_section.dart';
import 'package:portfolio/presentation/sections/what_section.dart';
import 'package:portfolio/presentation/sections/where_section.dart';
import 'package:portfolio/presentation/sections/who_section.dart';
import 'package:portfolio/utils/extensions.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/utils/zoom_widget_out.dart';
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

  @override
  void initState() {
    // TODO: implement initState
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
    return AnimatedBuilder(
        animation: _rotationValue,
        builder: (context, _) {
          return Scaffold(
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
                // When user scrolls, this will trigger onNotification.
                // updateOffsetAccordingToScroll updates the offset
                onNotification: updateOffsetAccordingToScroll,
                // ScrollConfiguration sets the scroll glow behaviour
                child: ScrollConfiguration(
                  behavior: NoScrollGlow(),
                  child: MouseRegion(
                    cursor: inMouseRegion
                        ? SystemMouseCursors.none
                        : SystemMouseCursors.basic,
                    onHover: ((event) {
                      print(event.localPosition.dx);
                      setState(() {
                        dx = event.localPosition.dx;
                        dy = event.localPosition.dy;
                      });
                    }),
                    child: Stack(
                      children: [
                        // Positioned(
                        //   right: 0,
                        //   child: SizedBox(
                        //     height: height,
                        //     width: width / 2,
                        //     child: const rive.RiveAnimation.asset(
                        //       'assets/rive/beach_icon.riv',
                        //     ),
                        //   ),
                        // ),
                        ListView(
                          children: [
                            HeaderSection(offsetHeader: offsetHeader),
                            // SizedBox(
                            //   height: 100,
                            //   child: ListView(
                            //     children: [
                            //       MouseRegion(
                            //         onEnter: (event) {
                            //           print('entro');
                            //           setState(() {
                            //             animate = true;
                            //           });
                            //         },
                            //         onExit: (event) {
                            //           setState(() {
                            //             animate = false;
                            //           });
                            //         },
                            //         child: AnimatedContainer(
                            //           height: 100,
                            //           width: animate ? 120 : 60,
                            //           duration:
                            //               const Duration(milliseconds: 500),
                            //           decoration: BoxDecoration(
                            //               borderRadius:
                            //                   BorderRadius.circular(20),
                            //               image: const DecorationImage(
                            //                   image: AssetImage(
                            //                       "assets/images/coding.jpg"))),
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // ),
                            WhoSection(
                              color: Colors.black,
                            ),
                            const WhatSection(
                              color: Colors.black,
                            ),

                            // _header(descriptionStyle, width, height,
                            //     Colors.black),
                            Stack(
                              children: <Widget>[
                                // Positioned(
                                //   // The hero image will be pushed up once user scrolls up
                                //   // That is why it is multiplied negatively.
                                //   top: -.25 * offset,
                                //   child: Container(
                                //     height: height,
                                //     width: width,
                                //     color: Colors.black,
                                //   ),
                                //   // child: Image.asset(
                                //   //   // From the transparent_image package
                                //   //   "assets/images/coding.JPG",
                                //   //   height: height,
                                //   //   width: width,
                                //   //   fit: BoxFit.cover,
                                //   // ),
                                // ),

                                // Positioned(
                                //   // top: -.25 * offset,
                                //   child: SizedBox(
                                //     height: height,
                                //     width: width,
                                //     child: _header(descriptionStyle, width),
                                //   ),
                                // ),
                                SingleChildScrollView(
                                  child: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      for (int i = 0;
                                          i < myapps.length;
                                          i++) ...{
                                        TechnologiesSection(
                                            index: i + 1,
                                            colors: myapps[i].colors,
                                            app: myapps[i].technologies),
                                        AppSection(
                                            app: myapps[i],
                                            offset: sectionsOffset[i]!,
                                            height: height,
                                            width: width,
                                            colors: myapps[i].colors,
                                            isPhone: false),
                                      },
                                      // Container(
                                      //   padding: const EdgeInsets.symmetric(
                                      //       horizontal: 40, vertical: 20),
                                      //   color: Colors.black,
                                      //   height: height / 2,
                                      //   child: Column(
                                      //     children: [
                                      //       const Text(
                                      //         "Technologies Used",
                                      //         style: TextStyle(
                                      //             color: Colors.white,
                                      //             fontSize: 30),
                                      //       ),
                                      //       Transform(
                                      //         transform: Matrix4.identity()
                                      //           ..setEntry(3, 2, 0.001)
                                      //           // ..rotateX((0.3 * (dy / 50) + -0.3))
                                      //           ..translate(
                                      //               (-0.3 * (dx / 5) + 0.3)),
                                      //         // (-0.3 * (dy / 5) + 0.3),
                                      //         // (-0.3 * (dx / 5) + 0.3)),
                                      //         // ..rotateY((-0.3 * (dx / 50) + 0.3)),
                                      //         alignment:
                                      //             FractionalOffset.center,
                                      //         child: Center(
                                      //           child: Text(
                                      //             myapps[0]
                                      //                 .technologies
                                      //                 .toUpperCase(),
                                      //             textAlign: TextAlign.center,
                                      //             style: const TextStyle()
                                      //                 .borderPaint(100,
                                      //                     Colors.white60),
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ).separatedColumn(40),
                                      // ),
                                      // _blueContainer4(
                                      //     height,
                                      //     width,
                                      //     TextStyle(color: Colors.white),
                                      //     TextStyle(),
                                      //     BoxDecoration(color: Colors.blue),
                                      //     "name",
                                      //     myapps[0],
                                      //     offset),
                                      // Container(
                                      //   padding: const EdgeInsets.symmetric(
                                      //       horizontal: 40, vertical: 20),
                                      //   color: Colors.black,
                                      //   height: height / 2,
                                      //   child: Column(
                                      //     children: [
                                      //       const Text(
                                      //         "Technologies Used",
                                      //         style: TextStyle(
                                      //             color: Colors.white,
                                      //             fontSize: 30),
                                      //       ),
                                      //       Transform(
                                      //         transform: Matrix4.identity()
                                      //           ..setEntry(3, 2, 0.001)
                                      //           // ..rotateX((0.3 * (dy / 50) + -0.3))
                                      //           ..translate(
                                      //               (-0.3 * (dx / 5) + 0.3)),
                                      //         // (-0.3 * (dy / 5) + 0.3),
                                      //         // (-0.3 * (dx / 5) + 0.3)),
                                      //         // ..rotateY((-0.3 * (dx / 50) + 0.3)),
                                      //         alignment:
                                      //             FractionalOffset.center,
                                      //         child: Center(
                                      //           child: Text(
                                      //             myapps[0]
                                      //                 .technologies
                                      //                 .toUpperCase(),
                                      //             textAlign: TextAlign.center,
                                      //             style: const TextStyle()
                                      //                 .borderPaint(100,
                                      //                     Colors.white60),
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ).separatedColumn(40),
                                      // ),
                                      // _blueContainer4(
                                      //     height,
                                      //     width,
                                      //     TextStyle(color: Colors.white),
                                      //     TextStyle(),
                                      //     BoxDecoration(color: Colors.blue),
                                      //     "name",
                                      //     myapps[0],
                                      //     offset1),
                                      // Container(
                                      //   padding: const EdgeInsets.symmetric(
                                      //       horizontal: 40, vertical: 20),
                                      //   color: Colors.black,
                                      //   height: height / 2,
                                      //   child: Column(
                                      //     children: [
                                      //       const Text(
                                      //         "Technologies Used",
                                      //         style: TextStyle(
                                      //             color: Colors.white,
                                      //             fontSize: 30),
                                      //       ),
                                      //       Transform(
                                      //         transform: Matrix4.identity()
                                      //           ..setEntry(3, 2, 0.001)
                                      //           // ..rotateX((0.3 * (dy / 50) + -0.3))
                                      //           ..translate(
                                      //               (-0.3 * (dx / 5) + 0.3)),
                                      //         // (-0.3 * (dy / 5) + 0.3),
                                      //         // (-0.3 * (dx / 5) + 0.3)),
                                      //         // ..rotateY((-0.3 * (dx / 50) + 0.3)),
                                      //         alignment:
                                      //             FractionalOffset.center,
                                      //         child: Center(
                                      //           child: Text(
                                      //             myapps[0]
                                      //                 .technologies
                                      //                 .toUpperCase(),
                                      //             textAlign: TextAlign.center,
                                      //             style: const TextStyle()
                                      //                 .borderPaint(100,
                                      //                     Colors.white60),
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ).separatedColumn(40),
                                      // ),
                                      // _blueContainer4(
                                      //     height,
                                      //     width,
                                      //     TextStyle(color: Colors.white),
                                      //     TextStyle(),
                                      //     BoxDecoration(color: Colors.blue),
                                      //     "name",
                                      //     myapps[0],
                                      //     offset2),

                                      // Container(
                                      //   padding: const EdgeInsets.symmetric(
                                      //       horizontal: 40, vertical: 20),
                                      //   color: Colors.black,
                                      //   height: height / 2,
                                      //   child: Column(
                                      //     children: [
                                      //       const Text(
                                      //         "Technologies Used",
                                      //         style: TextStyle(
                                      //             color: Colors.white,
                                      //             fontSize: 30),
                                      //       ),
                                      //       Center(
                                      //         child: Text(
                                      //           "Flutter Swift Kotlin Java SpringBoot Scrum Git "
                                      //               .toUpperCase(),
                                      //           style: const TextStyle()
                                      //               .borderPaint(
                                      //                   100, Colors.white60),
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ).separatedColumn(40),
                                      // ),
                                      // AppSection(
                                      //     app: myapps[0],
                                      //     offset: offset1,
                                      //     height: height,
                                      //     width: width,
                                      //     colors: myapps[0].colors,
                                      //     isPhone: false),
                                      // Container(
                                      //   color: Colors.black,
                                      //   height: height / 2,
                                      //   child: const Center(
                                      //     child: Text(
                                      //       "Aplicaciones para probar el estado del sdk de flutter web en la vida real por lo q se hace un portfolio para comprobar su compatibiidad",
                                      //       style: TextStyle(
                                      //           color: Colors.white),
                                      //     ),
                                      //   ),
                                      // ),
                                      // // _blueContainer4(
                                      // //     height,
                                      // //     width,
                                      // //     nameStyle,
                                      // //     descriptionStyle,
                                      // //     const BoxDecoration(

                                      // //         // border: Border.fromBorderSide(
                                      // //         //     BorderSide(color: Colors.black)),
                                      // //         gradient: LinearGradient(
                                      // //             begin: Alignment.topCenter,
                                      // //             end: Alignment.bottomCenter,
                                      // //             colors: [
                                      // //           Colors.blueGrey,
                                      // //           Colors.black
                                      // //         ])),
                                      // //     "Easy",
                                      // //     offset2),
                                      // AppSection(
                                      //     app: myapps[0],
                                      //     offset: offset2,
                                      //     height: height,
                                      //     width: width,
                                      //     colors: myapps[0].colors,
                                      //     isPhone: false),
                                      const WhereSection(
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: Stack(
                        //     children: [
                        //       for (int i = 0; i < moonlist.length; i++)
                        //         _transformWidget(moonlist[i], i),
                        //     ],
                        //   ),
                        // ),

                        AnimatedPositioned(
                          duration: duration,
                          curve: Curves.decelerate,
                          top: inMouseRegion ? dy : 40,
                          // : offset > height * 5
                          //     ? height - width / 5 - 20
                          //     : 10,
                          left: inMouseRegion ? dx : 40,
                          // : offset > height * 5
                          //     ? width - width / 5 - 20
                          //     : 10,
                          // child: InkWell(
                          // onTap: () {
                          //   if (_controller.isCompleted) {
                          //     _controller.reverse();
                          //   } else {
                          //     _controller.forward();
                          //   }
                          // },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            // constraints: BoxConstraints(
                            //     maxHeight: width / 10, maxWidth: width / 10),
                            curve: Curves.ease,
                            height: inMouseRegion ? 80 : 50,
                            // : offset > height
                            //     ? width / 5
                            //     : 50,
                            width: inMouseRegion ? 80 : 50,
                            // : offset > height
                            //     ? width / 5
                            //     : 50,

                            // width: offset > height ? (5 * offset / 50) : 20,
                            // decoration: BoxDecoration(
                            //     color: inMouseRegion
                            //         ? Colors.transparent
                            //         : Colors.yellow,
                            //     // : ((offset > height * 3)
                            //     //         ? (offset > height * 5)
                            //     //             ? Colors.indigo
                            //     //             : Colors.blue
                            //     //         : Colors.white)
                            //     //     .withOpacity(0.4),
                            //     borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: inMouseRegion
                                  ? const Icon(
                                      Icons.key,
                                      color: Colors.white,
                                      size: 40,
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MenuSection()));
                                      },
                                      icon: const Icon(
                                        Icons.menu,
                                        color: Colors.white,
                                      )),
                              // : const TestCube(size: 50),
                            ),
                            // child: AnimatedCrossFade(
                            //     firstChild: const TestCube(size: 50),
                            //     secondChild: const Icon(
                            //       Icons.key,
                            //       color: Colors.white,
                            //       size: 40,
                            //     ),
                            //     crossFadeState: inMouseRegion
                            //         ? CrossFadeState.showSecond
                            //         : CrossFadeState.showFirst,
                            //     duration: duration),
                          ),
                          // ),
                        ),
                        // if (offset > height * 3 && offset < height * 5) ...{
                        //   Positioned(
                        //       right: 50,
                        //       top: 50,
                        //       child: Image.asset(
                        //         "assets/images/coding.JPG",
                        //         height: 100,
                        //         width: 100,
                        //       ))
                        // }
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

  _header(
      TextStyle? descriptionStyle, double width, double height, Color color) {
    return Container(
      color: color,
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
                    "Wh".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 300,
                        fontFamily: 'Agne',
                        fontWeight: FontWeight.bold),
                  )),
                  // const SizedBox(
                  //   height: 500,
                  //   width: 500,
                  //   child: Center(child: ExampleExpandableFab()),
                  // ),
                  Center(
                      child: Text(
                    "?".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.indigo,
                        fontSize: 300,
                        fontFamily: 'Agne',
                        fontWeight: FontWeight.bold),
                  )),
                ],
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Text(
                    """Computer Sciences Engineer (Havana, UCI, 2013), experienced in mobile development with a demonstrated history of working in the information technology and services industry. Strong engineering professional skilled in Java, Android, Flutter, Web development, Agile Methodologies and Relational Databases.
""",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     for (int i = 0; i < 3; i++)
              //       Container(
              //         height: height / 4,
              //         width: width / 3 - 20,
              //         decoration: const BoxDecoration(color: Colors.indigo),
              //       )
              //   ],
              // ),
              // DefaultTextStyle(
              //   style: descriptionStyle!.copyWith(color: Colors.white),
              //   child: AnimatedTextKit(
              //     pause: const Duration(milliseconds: 4000),
              //     animatedTexts: [
              //       TypewriterAnimatedText('Discipline is the best tool'),
              //       TypewriterAnimatedText('Design first, then code'),
              //       TypewriterAnimatedText(
              //           'Do not patch bugs out, rewrite them'),
              //       TypewriterAnimatedText(
              //           'Do not test bugs out, design them out'),
              //     ],
              //     // onTap: () {
              //     //   print("Tap Event");
              //     // },
              //   ),
              // ),
              const SizedBox(height: 20),
              // Container(
              //   height: 300,
              //   width: width / 2,
              //   child: ListView(
              //     scrollDirection: Axis.horizontal,
              //     children: [
              //       for (var item in name)
              //         InkWell(
              //           onTap: () {
              //             print("tocar");
              //           },
              //           onHover: ((value) {
              //             if (value) {
              //               print("Hover $item");
              //               setState(() {
              //                 current = item;
              //               });
              //             } else {
              //               setState(() {
              //                 current = "";
              //               });
              //             }
              //           }),
              //           child: AnimatedContainer(
              //             curve: Curves.bounceIn,
              //             height: 100,
              //             duration: Duration(milliseconds: 500),
              //             child: Center(
              //               child: Text(
              //                 item,
              //                 style: TextStyle(
              //                     fontSize: current == item ? 50 : 30,
              //                     color: Colors.white),
              //               ),
              //             ),
              //           ),
              //         ),
              //     ],
              //   ),
              // )
            ],
          )),
    );
  }


  setMouseRegion(bool hovered) {
    setState(() {
      inMouseRegion = hovered;
    });
  }

  /// Returns true to cancel the notification bubbling.
  bool updateOffsetAccordingToScroll(ScrollNotification scrollNotification) {
    setState(() {
      offsetHeader = scrollNotification.metrics.pixels;
      offset = scrollNotification.metrics.pixels - height * 2.5;
      // sectionsOffset[0] = offset;
      print("Offset: $offset");
      print("Offsetheader: $offsetHeader");
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
          // Future.delayed(const Duration(milliseconds: 800))
          //     .then((value) => animationController.reset());
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
