import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
// Import transparent_image in pubspec.yaml file



class Section extends StatefulWidget {
  @override
  _SectionState createState() => _SectionState();
}

class _SectionState extends State<Section> {
  double offset = 0;
  List<String> name = "Roberto Marto Ramirez".split("");
  String current = "";
  var height;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final nameStyle = Theme.of(context).textTheme.headline2;
    final descriptionStyle = Theme.of(context).textTheme.headline4;
    return Material(
      child: NotificationListener<ScrollNotification>(
        // When user scrolls, this will trigger onNotification.
        // updateOffsetAccordingToScroll updates the offset
        onNotification: updateOffsetAccordingToScroll,
        // ScrollConfiguration sets the scroll glow behaviour
        child: ScrollConfiguration(
          behavior: NoScrollGlow(),
          child: Stack(
            children: <Widget>[
              Positioned(
                // The hero image will be pushed up once user scrolls up
                // That is why it is multiplied negatively.
                top: -.25 * offset,
                child: Container(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
                // child: Image.asset(
                //   // From the transparent_image package
                //   "assets/images/coding.JPG",
                //   height: height,
                //   width: width,
                //   fit: BoxFit.cover,
                // ),
              ),
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
                    // IgnorePointer(
                    //     ignoring: true, child: SizedBox(height: height)),
                    _blueContainer(
                        height,
                        width,
                        nameStyle!,
                        descriptionStyle!,
                        Colors.black,
                        "Aplicación numero 1"),
                    // _whiteContainer(height, width, nameStyle,
                    //     descriptionStyle!, Colors.white),
                    // _blueContainer(
                    //     height,
                    //     width,
                    //     nameStyle,
                    //     descriptionStyle,
                    //     Colors.indigo,
                    //     "Aplicación numero 2"),
                    // _blueContainer(
                    //     height,
                    //     width,
                    //     nameStyle,
                    //     descriptionStyle,
                    //     Colors.green,
                    //     "Aplicación numero 3"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _header(TextStyle? descriptionStyle, double width, double height) {
    return Container(
      color: Colors.black,
      height: height,
      child: Align(
          alignment: Alignment(0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Mi nombre',
                style: descriptionStyle!.copyWith(color: Colors.white),
              ),
              SizedBox(height: 20),
              Container(
                height: 300,
                width: width / 2,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var item in name)
                      InkWell(
                        onTap: () {
                          print("tocar");
                        },
                        onHover: ((value) {
                          if (value) {
                            print("Hover $item");
                            setState(() {
                              current = item;
                            });
                          } else {
                            setState(() {
                              current = "";
                            });
                          }
                        }),
                        child: AnimatedContainer(
                          curve: Curves.bounceIn,
                          height: 100,
                          duration: Duration(milliseconds: 500),
                          child: Center(
                            child: Text(
                              item,
                              style: TextStyle(
                                  fontSize: current == item ? 50 : 30,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Container _blueContainer(double height, double width, TextStyle nameStyle,
      TextStyle descriptionStyle, Color color, String name) {
    var clipRRect = ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: height / 3,
        // width: width / 5,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(20)),
        child: Image.asset(
          // From the transparent_image package

          kHeroImage,
          height: height / 3,
          // width: width,
          // fit: BoxFit.cover,
        ),
      ),
    );
    var clipRRectBig = ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: height / 2,
        // width: width / 5,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Image.asset(
          // From the transparent_image package
          kHeroImage,
          height: height / 2,
          // width: width,
          // fit: BoxFit.cover,
        ),
      ),
    );
    var clipRRectHuge = ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: height,
        // width: width / 5,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Image.asset(
          // From the transparent_image package
          kHeroImage,
          height: height,
          // width: width,
          // fit: BoxFit.cover,
        ),
      ),
    );
    return Container(
      height: height * 2,
      width: width,
      color: color,
      child: Stack(children: [
        Positioned(
            left: 20,
            top: 0.5 * offset,
            child: Column(
              children: [
                Text(
                  name,
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                const Text(
                  "Descripcion de esta talla porque si bla bla bla",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            )),
        // const Center(
        //   child: Text(
        //     "Algunas de mis apps",
        //     style: TextStyle(
        //         fontSize: 30,
        //         fontWeight: FontWeight.bold,
        //         color: Colors.indigo),
        //   ),
        // ),
        // Positioned(
        //   top: -.35 * offset,
        //   left: -200,
        //   child: SizedBox(
        //     height: height,
        //     width: width / 3,
        //     child: Align(
        //         child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         clipRRectHuge,
        //       ],
        //     )),
        //   ),
        // ),
        // Positioned(
        //   top: -.25 * offset,
        //   left: 90,
        //   child: SizedBox(
        //     height: height,
        //     width: width / 3,
        //     child: Align(
        //         child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         clipRRect,

        //       ],
        //     )),
        //   ),
        // ),
        // Positioned(
        //   top: -.25 * offset,
        //   left: 500,
        //   child: SizedBox(
        //     height: height,
        //     width: width / 2,
        //     child: Align(
        //         child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         clipRRectBig,

        //       ],
        //     )),
        //   ),
        // ),
        Positioned(
          top: -0.4 * offset,
          right: 20,
          child: SizedBox(
            height: height,
            width: width / 3,
            child: Align(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                clipRRect,
              ],
            )),
          ),
        ),
        Positioned(
          top: -0.4 * offset + 400,
          right: 20,
          child: SizedBox(
            height: height,
            width: width / 3,
            child: Align(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                clipRRect,
              ],
            )),
          ),
        ),
        Positioned(
          top: 0.4 * offset,
          right: 20,
          child: SizedBox(
            height: height,
            width: width / 3,
            child: Align(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                clipRRectBig,
              ],
            )),
          ),
        ),
        Positioned(
          top: -0.2 * offset,
          right: 250,
          child: SizedBox(
            height: height,
            width: width / 3,
            child: Align(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                clipRRectBig,
              ],
            )),
          ),
        ),
        Positioned(
          top: 0.2 * offset,
          right: 250,
          child: SizedBox(
            height: height,
            width: width / 3,
            child: Align(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                clipRRect,
              ],
            )),
          ),
        ),
        // Positioned(
        //   top: (-0.5 * offset) + 480,
        //   right: 20,
        //   child: SizedBox(
        //     height: height,
        //     width: width / 3,
        //     child: Align(
        //         child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         clipRRectBig,
        //       ],
        //     )),
        //   ),
        // ),
        // Positioned(
        //   top: -0.6 * offset * 2,
        //   right: 30,
        //   child: SizedBox(
        //     height: height,
        //     width: width / 3,
        //     child: Align(
        //         child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         clipRRect,
        //       ],
        //     )),
        //   ),
        // ),
        // Positioned(
        //   top: -0.8 * offset * 2,
        //   right: 250,
        //   child: SizedBox(
        //     height: height,
        //     width: width / 3,
        //     child: Align(
        //         child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         clipRRectBig,
        //       ],
        //     )),
        //   ),
        // ),
        // Positioned(
        //   top: .35 * offset,
        //   left: 20,
        //   child: SizedBox(
        //     height: height,
        //     width: width / 3,
        //     child: Align(
        //         child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         clipRRect,
        //       ],
        //     )),
        //   ),
        // ),
        // Positioned(
        //   top: .35 * offset,
        //   left: 300,
        //   child: SizedBox(
        //     height: height,
        //     width: width / 3,
        //     child: Align(
        //         child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         clipRRectBig,
        //       ],
        //     )),
        //   ),
        // ),
        // Positioned(
        //   top: .35 * offset,
        //   right: -200,
        //   child: SizedBox(
        //     height: height,
        //     width: width / 3,
        //     child: Align(
        //         child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         clipRRectHuge,
        //         const SizedBox(
        //           height: 10,
        //         ),
        //         const Text(
        //           'Happy Haris',
        //           style: TextStyle(color: Colors.white),
        //         ),
        //       ],
        //     )),
        //   ),
        // ),
        // Positioned(
        //   top: 0.25 * offset,
        //   right: 0.25 * offset,
        //   child: SizedBox(
        //     height: height,
        //     width: width / 3,
        //     child: Align(
        //         child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         clipRRect,
        //       ],
        //     )),
        //   ),
        // ),
      ]),
    );
  }

  Container _whiteContainer(
    double height,
    double width,
    TextStyle nameStyle,
    TextStyle descriptionStyle,
    Color color,
  ) {
    var clipRRect = ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: height / 3,
        // width: width / 5,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(20)),
        child: Image.asset(
          // From the transparent_image package

          kHeroImage,
          height: height / 3,
          // width: width,
          fit: BoxFit.cover,
        ),
      ),
    );
    var clipRRectBig = ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: height / 2,
        // width: width / 5,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Image.asset(
          // From the transparent_image package
          kHeroImage,
          height: height / 2,
          // width: width,
          fit: BoxFit.cover,
        ),
      ),
    );
    var clipRRectHuge = ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: height,
        // width: width / 5,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Image.asset(
          // From the transparent_image package
          kHeroImage,
          height: height,
          // width: width,
          fit: BoxFit.cover,
        ),
      ),
    );
    return Container(
      height: height * 2,
      width: width,
      color: color,
      child: Stack(children: [
        Positioned(
            left: 20,
            top: 0.5 * offset,
            child: Column(
              children: [
                Text(
                  "Aplicacion esta",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                Text(
                  "Descripcion de esta talla porque si bla bla bla",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            )),
        // const Center(
        //   child: Text(
        //     "Algunas de mis apps",
        //     style: TextStyle(
        //         fontSize: 30,
        //         fontWeight: FontWeight.bold,
        //         color: Colors.indigo),
        //   ),
        // ),
        // Positioned(
        //   top: -.35 * offset,
        //   left: -200,
        //   child: SizedBox(
        //     height: height,
        //     width: width / 3,
        //     child: Align(
        //         child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         clipRRectHuge,
        //       ],
        //     )),
        //   ),
        // ),
        // Positioned(
        //   top: -.25 * offset,
        //   left: 90,
        //   child: SizedBox(
        //     height: height,
        //     width: width / 3,
        //     child: Align(
        //         child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         clipRRect,

        //       ],
        //     )),
        //   ),
        // ),
        // Positioned(
        //   top: -.25 * offset,
        //   left: 500,
        //   child: SizedBox(
        //     height: height,
        //     width: width / 2,
        //     child: Align(
        //         child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         clipRRectBig,

        //       ],
        //     )),
        //   ),
        // ),
        Positioned(
          top: -0.4 * offset,
          right: 20,
          child: SizedBox(
            height: height,
            width: width / 3,
            child: Align(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                clipRRect,
              ],
            )),
          ),
        ),
        Positioned(
          top: -0.4 * offset + 400,
          right: 20,
          child: SizedBox(
            height: height,
            width: width / 3,
            child: Align(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                clipRRect,
              ],
            )),
          ),
        ),
        Positioned(
          top: 0.4 * offset,
          right: 20,
          child: SizedBox(
            height: height,
            width: width / 3,
            child: Align(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                clipRRectBig,
              ],
            )),
          ),
        ),
        Positioned(
          top: -0.2 * offset,
          right: 250,
          child: SizedBox(
            height: height,
            width: width / 3,
            child: Align(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                clipRRectBig,
              ],
            )),
          ),
        ),
        Positioned(
          top: 0.2 * offset,
          right: 250,
          child: SizedBox(
            height: height,
            width: width / 3,
            child: Align(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                clipRRect,
              ],
            )),
          ),
        ),
        // Positioned(
        //   top: (-0.5 * offset) + 480,
        //   right: 20,
        //   child: SizedBox(
        //     height: height,
        //     width: width / 3,
        //     child: Align(
        //         child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         clipRRectBig,
        //       ],
        //     )),
        //   ),
        // ),
        // Positioned(
        //   top: -0.6 * offset * 2,
        //   right: 30,
        //   child: SizedBox(
        //     height: height,
        //     width: width / 3,
        //     child: Align(
        //         child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         clipRRect,
        //       ],
        //     )),
        //   ),
        // ),
        // Positioned(
        //   top: -0.8 * offset * 2,
        //   right: 250,
        //   child: SizedBox(
        //     height: height,
        //     width: width / 3,
        //     child: Align(
        //         child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         clipRRectBig,
        //       ],
        //     )),
        //   ),
        // ),
        // Positioned(
        //   top: .35 * offset,
        //   left: 20,
        //   child: SizedBox(
        //     height: height,
        //     width: width / 3,
        //     child: Align(
        //         child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         clipRRect,
        //       ],
        //     )),
        //   ),
        // ),
        // Positioned(
        //   top: .35 * offset,
        //   left: 300,
        //   child: SizedBox(
        //     height: height,
        //     width: width / 3,
        //     child: Align(
        //         child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         clipRRectBig,
        //       ],
        //     )),
        //   ),
        // ),
        // Positioned(
        //   top: .35 * offset,
        //   right: -200,
        //   child: SizedBox(
        //     height: height,
        //     width: width / 3,
        //     child: Align(
        //         child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         clipRRectHuge,
        //         const SizedBox(
        //           height: 10,
        //         ),
        //         const Text(
        //           'Happy Haris',
        //           style: TextStyle(color: Colors.white),
        //         ),
        //       ],
        //     )),
        //   ),
        // ),
        // Positioned(
        //   top: 0.25 * offset,
        //   right: 0.25 * offset,
        //   child: SizedBox(
        //     height: height,
        //     width: width / 3,
        //     child: Align(
        //         child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         clipRRect,
        //       ],
        //     )),
        //   ),
        // ),
      ]),
    );
  }

  /// Returns true to cancel the notification bubbling.
  bool updateOffsetAccordingToScroll(ScrollNotification scrollNotification) {
    setState(() => offset = scrollNotification.metrics.pixels);
    print("Offset:" + offset.toString());
    if (offset > 1920) {
      setState(() {
        offset = offset / 2;
      });
    }
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

const kHeroImage = 'assets/images/iphone.png';
