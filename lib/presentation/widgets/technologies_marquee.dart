import 'package:flutter/material.dart';
import 'package:portfolio/presentation/providers/offsets_provider.dart';
import 'package:portfolio/utils/extensions.dart';
import 'package:provider/provider.dart';

class TechnologiesMarquee extends StatelessWidget {
  final int index;
  final String technologies;
  const TechnologiesMarquee(
      {required this.index, required this.technologies, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var technology = Text(
      technologies,
      style: const TextStyle(
        fontFamily: 'War',
        fontWeight: FontWeight.bold,
        fontSize: 70,
        color: Colors.white,
      ),
    ).fit();
    return Column(
      children: [
        Transform.translate(
          offset: Offset(
              ((context.read<OffsetsProvider>().offsetHeader -
                      (index * 2.5) * MediaQuery.of(context).size.height) /
                  10),
              0),
          child: technology,
        ),
        Transform.translate(
          offset: Offset(
              (-(context.read<OffsetsProvider>().offsetHeader -
                      (index * 2.5) * MediaQuery.of(context).size.height) /
                  10),
              0),
          child: Text(technologies,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                      fontFamily: 'War',
                      color: Color.fromARGB(255, 62, 62, 62)))
              .fit(),
        )
      ],
    );
  }
}
