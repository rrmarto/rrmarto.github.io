import 'package:flutter/material.dart';
import 'package:portfolio/presentation/providers/offsets_provider.dart';
import 'package:provider/provider.dart';

class OpaqueWidget extends StatelessWidget {
  final Widget child;
  const OpaqueWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool mouseRegion = context.read<OffsetsProvider>().mouseRegion;
    return AnimatedOpacity(
      opacity: mouseRegion ? 0.2 : 1,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 500),
      child: child,
    );
  }
}
