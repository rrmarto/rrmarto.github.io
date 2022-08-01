import 'package:flutter/material.dart';
import 'package:portfolio/test_cube.dart';
import 'package:portfolio/utils/utils.dart';

class WhereSection extends StatelessWidget {
  final Color color;
  const WhereSection({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return SizedBox(
      // color: color,
      height: height,
      child: Align(
          alignment: const Alignment(0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Text(
              //   'Mi nombres',
              //   style: descriptionStyle!.copyWith(color: Colors.white),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    "Where?".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 200,
                        fontWeight: FontWeight.bold),
                  )),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(40),
                alignment: Alignment.bottomCenter,
                height: height / 4,
                // color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (var contact in contacts)
                      Image.asset(
                        "assets/images/contact/$contact",
                        height: 60,
                        width: 60,
                      ),
                    const Center(child: TestCube(size: 100))
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          )),
    );
  }
}
