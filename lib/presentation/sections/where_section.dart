import 'package:flutter/material.dart';
import 'package:portfolio/test_cube.dart';
import 'package:portfolio/utils/extensions.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class WhereSection extends StatelessWidget {
  final Color color;
  final SizingInformation dimensions;
  const WhereSection({Key? key, required this.color, required this.dimensions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

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
                      child: SizedBox(
                    width: width - width / 3,
                    child: Text(
                      "Where?".toUpperCase(),
                      style: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 200,
                          fontWeight: FontWeight.bold),
                    ).fit(),
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
                      InkWell(
                        onTap: () {
                          launchUrl(Uri.parse(contact.url));
                        },
                        child: Image.asset(
                          "assets/images/contact/${contact.image}",
                          height: getValueForScreenType<double>(
                            context: context,
                            mobile: 30,
                            tablet: 60,
                            desktop: 60,
                          ),
                          // width: 60,
                        ),
                      ),
                    Center(
                        child: TestCube(
                            size: getValueForScreenType<double>(
                      context: context,
                      mobile: 40,
                      tablet: 40,
                      desktop: 100,
                    )))
                  ],
                ).shaderOnWidget(const LinearGradient(
                    colors: [Colors.blue, Color.fromARGB(255, 205, 255, 231)])),
              ),

              const SizedBox(height: 20),
            ],
          )),
    );
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
