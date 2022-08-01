import 'package:flutter/material.dart';

class PortfolioNetworkImage extends StatelessWidget {
  final String url;
  final double widthImage;
  final double heightImage;

  const PortfolioNetworkImage(
      {Key? key,
      required this.url,
      required this.widthImage,
      required this.heightImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget weincodeImage = Image.network(
      url,
      width: widthImage,
      height: heightImage,
    );
    return weincodeImage;
  }
}
