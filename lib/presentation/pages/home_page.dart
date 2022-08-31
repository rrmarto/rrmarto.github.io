import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/presentation/providers/offsets_provider.dart';
import 'package:portfolio/presentation/sections/app_section.dart';
import 'package:portfolio/presentation/sections/header_section.dart';
import 'package:portfolio/presentation/sections/menu_section.dart';
import 'package:portfolio/presentation/sections/technologies_section.dart';
import 'package:portfolio/presentation/sections/what_section.dart';
import 'package:portfolio/presentation/sections/where_section.dart';
import 'package:portfolio/presentation/sections/who_section.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double offset = 0;
  double dx = 0;
  double dy = 0;
  Duration duration = const Duration(seconds: 1);
  bool inMouseRegion = false;
  late double height;
  late double width;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Scaffold(
        key: _scaffoldKey,
        drawer: MenuSection(
          dimensions: sizingInformation,
        ),
        backgroundColor: Colors.black,
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
                        HeaderSection(dimensions: sizingInformation),
                        WhoSection(
                            color: Colors.black, dimensions: sizingInformation),
                        WhatSection(
                            color: Colors.black, dimensions: sizingInformation),
                        Stack(
                          children: <Widget>[
                            Consumer<OffsetsProvider>(
                                builder: (context, model, _) {
                              return SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    for (int i = 0;
                                        i < model.offsets.length;
                                        i++) ...{
                                      TechnologiesSection(
                                          index: i + 1,
                                          colors: myInfo.apps[i].colors,
                                          dimensions: sizingInformation,
                                          app: myInfo.apps[i]),
                                      AppSection(
                                          app: myInfo.apps[i],
                                          offset: model.offsets[i],
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
                              );
                            })
                          ],
                        ),
                      ],
                    ),
                    AnimatedPositioned(
                      duration: duration,
                      curve: Curves.decelerate,
                      top: inMouseRegion ? dy : 40,
                      right: inMouseRegion ? (width - dx) : 40,
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
                                  onPressed: () => showPDFPreview(context),
                                  icon: const Icon(
                                    CupertinoIcons.doc_person_fill,
                                    color: Colors.white,
                                    size: 40,
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

  bool updateOffsetAccordingToScroll(ScrollNotification scrollNotification) {
    context
        .read<OffsetsProvider>()
        .setOffsets(scrollNotification.metrics.pixels, height);
    setState(() {
      if ((context.read<OffsetsProvider>().mouseRegion)) {
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
