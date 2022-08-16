import 'package:flutter/material.dart';
import 'package:portfolio/domain/entities/apps_model.dart';
import 'package:portfolio/presentation/providers/responsive_breakpoints_provider.dart';
import 'package:portfolio/presentation/widgets/phone_widget.dart';
import 'package:portfolio/utils/enums.dart';
import 'package:portfolio/utils/extensions.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class AppSection extends StatelessWidget {
  late double height;
  late double width;
  late AppsModel app;
  late bool isPhone;
  final SizingInformation dimensions;
  double offset;

  AppSection(
      {Key? key,
      required this.app,
      required this.offset,
      required this.height,
      required this.width,
      required this.isPhone,
      required this.dimensions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // colors.last=colors.last.withOpacity(0.3);
    BreakPoint breakPoint =
        context.watch<ResponsiveBreakPointsProvider>().breakpoint;

    return Container(
      height: height * 2,
      width: width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [for (var color in app.colors) color],
      )),
      child: Stack(children: [
        dimensions.isDesktop
            ? Container(
                padding: const EdgeInsets.all(20),
                width: width / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(50),
                      margin: const EdgeInsets.fromLTRB(20, 50, 50, 50),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                                spreadRadius: 20,
                                blurRadius: 20,
                                color: Colors.black12,
                                offset: Offset(30, 30))
                          ],
                          // border: Border.all(color: Colors.white, width: 10)
                          color: app.colors[0]),
                      child: Column(
                        children: [
                          Center(
                              child: Text(
                            app.name.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: isPhone ? 40 : 75,
                            ),
                          )),

                          // DefaultTextStyle(
                          //   style: TextStyle(
                          //       fontSize: isPhone ? 20 : 30,
                          //       fontFamily: 'Agne',
                          //       color: Colors.white),
                          //   child: AnimatedTextKit(
                          //     pause: const Duration(milliseconds: 4000),
                          //     animatedTexts: [
                          //       TypewriterAnimatedText(
                          //           """Esta aplicación se realizó con el objetivo de controlar los sitemas privados de la empresa. La misma se realizo usando el framework flutter ademas de otras teccnologias""" *
                          //               5),
                          //       // TypewriterAnimatedText('Design first, then code'),
                          //       // TypewriterAnimatedText(
                          //       //     'Do not patch bugs out, rewrite them'),
                          //       // TypewriterAnimatedText(
                          //       //     'Do not test bugs out, design them out'),
                          //     ],
                          //     onTap: () {
                          //       print("Tap Event");
                          //     },
                          //   ),
                          // ),
                          // Text(
                          //   "Aplicación de control de accesos".toUpperCase(),
                          //   style: TextStyle(
                          //       fontSize: isPhone ? 20 : 30,
                          //       fontFamily: 'Agne',
                          //       color: Colors.white),
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(50),
                      margin: const EdgeInsets.fromLTRB(20, 50, 50, 50),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                                spreadRadius: 20,
                                blurRadius: 20,
                                color: Colors.black12,
                                offset: Offset(30, 30))
                          ],
                          // border: Border.all(color: Colors.white, width: 10),
                          color: app.colors[1]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            app.description,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: (() =>
                                    launchUrl(Uri.parse(app.storeUrls[1]))),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Icon(
                                    Icons.apple,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (() =>
                                    launchUrl(Uri.parse(app.storeUrls[0]))),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Icon(
                                    Icons.android,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ).separatedColumn(30),
                    )
                  ],
                ).separatedColumn(30, alignment: MainAxisAlignment.center),
              )
            : Container(),
        // _transformWidget("stars.png", 1, fullSize: true),

        for (int j = 0; j < app.images.length; j++)
          Positioned(
              top: cardsOffset[j].dy * offset,
              right: cardsOffset[j].dx,
              child: PhoneWidget(
                  height: height, width: width, image: app.images[j]))
        //medio derecha
        // Positioned(
        //   top: 0.25 * currentOffset,
        //   right: isPhone ? 0 : -30,
        //   child: _phoneWidget(height, width),
        // ),

        // //arriba derecha
        // Positioned(
        //     top: -0.4 * currentOffset,
        //     right: 20,
        //     child: _phoneWidget(height, width)),

        // //abajo derecha

        // Positioned(
        //     top: 0.7 * currentOffset,
        //     right: 20,
        //     child: _phoneWidget(height, width)),

        // //arriba izquierda
        // Positioned(
        //     top: -0.1 * currentOffset,
        //     right: isPhone ? 250 : 300,
        //     child: _phoneWidget(height, width)),

        // //abajo izquierda
        // Positioned(
        //     top: 0.5 * currentOffset,
        //     right: isPhone ? 270 : 350,
        //     child: _phoneWidget(height, width)),
      ]),
    );
  }
}
