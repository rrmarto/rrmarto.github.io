import 'package:flutter/material.dart';
import 'package:portfolio/presentation/atomic_design/foundations/sizes.dart';

class PortfolioSepareted extends StatelessWidget {
  final double nSepareted;
  const PortfolioSepareted({Key? key, required this.nSepareted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: nSepareted * PortfolioSizesFoundation.baseSepareted,
    );
  }
}
