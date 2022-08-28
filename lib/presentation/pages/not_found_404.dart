import 'package:flutter/material.dart';
import 'package:portfolio/presentation/widgets/bouncing_widget.dart';
import 'package:portfolio/utils/extensions.dart';
import 'package:rive/rive.dart' as rive;

class NotFound404 extends StatelessWidget {
  final String route;
  const NotFound404({Key? key, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: const BouncingWidget(
                child: Text(
              '404',
              style: TextStyle(
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                  fontSize: 300),
            )).fit(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Text(
              route,
              style: const TextStyle(color: Colors.white, fontSize: 300),
            ).fit().shaderOnWidget(const LinearGradient(
                colors: [Colors.blue, Color.fromARGB(255, 205, 255, 231)])),
          ),
          const rive.RiveAnimation.asset(
            'assets/rive/barrier_gate.riv',
            animations: ['Close barrier'],
          ),
        ],
      ),
    );
  }
}
