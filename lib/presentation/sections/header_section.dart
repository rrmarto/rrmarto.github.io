import 'package:flutter/material.dart';
import 'package:portfolio/presentation/atomic_design/foundations/colors.dart';
import 'package:portfolio/presentation/atomic_design/foundations/texts.dart';
import 'package:portfolio/presentation/atomic_design/foundations/typography.dart';
import 'package:portfolio/utils/extensions.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/utils/zoom_widget_out.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeaderSection extends StatefulWidget {
  final double offsetHeader;
  final SizingInformation dimensions;
  const HeaderSection(
      {Key? key, required this.offsetHeader, required this.dimensions})
      : super(key: key);

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  double dx = 0;

  double dy = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return MouseRegion(
      onHover: ((event) {
        setState(() {
          dx = event.localPosition.dx;
          dy = event.localPosition.dy;
        });
      }),
      child: Container(
        // color: Colors.black,
        decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     stops: [0.5, 1.0],
            //     colors: [Colors.black, Colors.black]
            //     )
            ),
        child: SizedBox(
          // constraints: BoxConstraints(maxHeight: height),
          // decoration: BoxDecoration(
          //     color: Colors.black,
          //     image: DecorationImage(
          //         fit: BoxFit.cover,
          //         image: AssetImage("assets/images/coding.JPG"))),
          height: height,
          child: Stack(
            children: [
              Positioned(
                top: 40,
                left: width / 10,
                right: width / 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // _transformWidget2(_nameWidget(width, height), 1),
                    _nameWidget(width, height),
                    const SizedBox(
                      height: 50,
                      // child: Divider(
                      //   color: Colors.white,
                      // ),
                    ),
                    _professionWidget(height, width)
                    // _transformWidget2(_professionWidget(height, width), 3)
                  ],
                ),
              ),
              Positioned(
                  top: getValueForScreenType<double>(
                    context: context,
                    mobile: height / 2.5,
                    tablet: height / 3,
                    desktop: 170,
                  ),
                  left: width / 8,
                  child: _portfolioStampWidget(context, width)
                  //  _transformWidget2(
                  //     _portfolioStampWidget(context, width), 2)
                  ),
            ],
          ),
        ),
      ),
    );
  }

  Center _professionWidget(double height, double width) {
    return Center(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 700),
        opacity: widget.offsetHeader < height / 2 ? 1 : 0,
        child: SizedBox(
          width: width - width / 3,
          height: height / 6,
          child: Text(
            myInfo.profession,
            style: const TextStyle(
              fontSize: PortfolioTypographyFoundation.fontSizeH2,
              color: PortfolioColorsFoundation.secondaryWhiteColor,
            ),
          )
              .shaderOnWidget(const LinearGradient(colors: [
                PortfolioColorsFoundation.secondaryBlueColor,
                PortfolioColorsFoundation.secondaryLightGreenColor,
              ]))
              .fit(),
        ),
      ),
    );
  }

  ZoomWidgetOut _portfolioStampWidget(BuildContext context, double width) {
    return ZoomWidgetOut(
      from: 10,
      delay: const Duration(seconds: 1),
      child: Transform.rotate(
        angle: 0.3,
        child: Container(
          padding: EdgeInsets.all(getValueForScreenType<double>(
            context: context,
            mobile: 2,
            tablet: 20,
            desktop: 20,
          )),
          height: width / 8,
          width: getValueForScreenType<double>(
            context: context,
            mobile: width / 2,
            tablet: width / 4,
            desktop: width / 4,
          ),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.yellow,
                  width: getValueForScreenType<double>(
                    context: context,
                    mobile: 5,
                    tablet: 15,
                    desktop: 15,
                  )),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              PortfolioTextsFoundation.portfolio,
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: getValueForScreenType<double>(
                    context: context,
                    mobile: 20,
                    tablet: 20,
                    desktop: 60,
                  ),
                  fontFamily: 'Ways'),
            ).fit(),
          ),
        ),
      ),
    );
  }

  Center _nameWidget(double width, double height) {
    return Center(
      child: SizedBox(
        width: width - width / 3,
        height: height - height / 3,
        child: AnimatedOpacity(
          opacity: widget.offsetHeader < height / 2 ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: Text(
            myInfo.nameMultiLine.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: PortfolioTypographyFoundation.fontSizeH1,
              fontFamily: PortfolioTypographyFoundation.familyHeadings,
              color: PortfolioColorsFoundation.secondaryWhiteColor,
            ),
          )
              .shaderOnWidget(const LinearGradient(colors: [
                PortfolioColorsFoundation.secondaryBlueColor,
                PortfolioColorsFoundation.secondaryLightGreenColor
              ]))
              .fit(),
        ),
      ),
    );
  }

  _transformWidget2(Widget widget, int index, {bool fullSize = false}) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        // ..rotateX((0.3 * (dy / 50) + -0.3))
        ..translate(
          (-0.3 * (dx / 5 * (index + 1)) + 0.3),
          (-0.3 * (dy / 5 * (index + 1)) + 0.3),
          (-0.3 * (dy / 5 * (index + 1)) + 0.3),
        ),
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
    );
  }
}
