import 'package:flutter/material.dart';
import 'package:portfolio/presentation/widgets/phone_parallax.dart';
import 'package:portfolio/presentation/providers/responsive_breakpoints_provider.dart';
import 'package:portfolio/utils/enums.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PhoneWidget extends StatelessWidget {
  String image;
  double height;
  double width;
  late BreakPoint breakPoint;
  PhoneWidget(
      {required this.image,
      required this.height,
      required this.width,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _mobile(),
      tablet: _tablet(),
      desktop: _desktop(),
    );
  }

  SizedBox _mobile() {
    return SizedBox(
      height: height,
      width: width / 2,
      child: Align(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: height / 2.5,
              width: height / 4,
              child: PhoneParallax(
                height: height / 2.5,
                width: height / 4,
                image: image,
              ))
        ],
      )),
    );
  }

  SizedBox _desktop() {
    return SizedBox(
      height: height,
      width: width / 3,
      child: Align(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: height / 2 + 20,
              width: 230,
              child: PhoneParallax(
                height: height / 2 + 20,
                width: 230,
                image: image,
              ))
        ],
      )),
    );
  }

  SizedBox _tablet() {
    return SizedBox(
      height: height,
      width: width / 3,
      child: Align(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: height / 2,
              width: height / 4,
              child: PhoneParallax(
                height: height / 2,
                width: height / 4,
                image: image,
              ))
        ],
      )),
    );
  }
}
