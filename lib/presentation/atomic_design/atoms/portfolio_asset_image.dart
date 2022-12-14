import 'package:flutter/material.dart';

class PortfolioAssetImage extends StatelessWidget {
  final String path;
  final double widthImage;

  const PortfolioAssetImage({
    Key? key,
    required this.path,
    required this.widthImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget portfolioAssetImage = Image.asset(
      path,
      width: widthImage,
      height: widthImage,
      fit: BoxFit.cover,
    );
    return portfolioAssetImage;
  }
}
