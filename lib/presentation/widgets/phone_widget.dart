import 'package:flutter/material.dart';
import 'package:portfolio/card_parallax.dart';

class PhoneWidget extends StatelessWidget {
  String image;
  double height;
  double width;
   PhoneWidget({
    required this.image,required this.height,required this.width,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width / 3,
      child: Align(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // clipRRectBig,
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: width > 400 ? height / 2 : height / 3,
              width: width > 400 ? 230 : width / 2,
              child: CardParallax(
                height: width > 400 ? height / 2 : height / 3,
                width: width > 400 ? 230 : width / 2,
                image: image,
              ))
        ],
      )),
    );
    ;
  }
}
