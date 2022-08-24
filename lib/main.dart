import 'package:flutter/material.dart';
import 'package:portfolio/presentation/providers/offsets_provider.dart';
import 'package:portfolio/presentation/providers/responsive_breakpoints_provider.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'core/router.dart' as r;
// Import transparent_image in pubspec.yaml file

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (context) => ResponsiveBreakPointsProvider()),
      ChangeNotifierProvider(create: (context) => OffsetsProvider()),
    ],
    child: MyPortfolio(),
  ));
  setUrlStrategy(PathUrlStrategy());
}

class MyPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Roberto Marto | Portfolio',
      onGenerateRoute: r.Router.generateRoute,
      initialRoute: firstScreen,
      // home: Scaffold(
      //     backgroundColor: Colors.black,
      //     body: Stack(
      //       children: const [
      //         // Positioned(
      //         //   right: 0,
      //         //   top: 0,
      //         //   child: SizedBox(
      //         //     height: 800,
      //         //     width: 800,
      //         //     child: RiveAnimation.asset(
      //         //       'assets/rive/beach_icon.riv',
      //         //     ),
      //         //   ),
      //         // ),
      //         // Center(
      //         //   child: ListView(
      //         //     children: const [
      //         //       Center(
      //         //         child: Text(
      //         //           "Credits",
      //         //           style: TextStyle(fontSize: 60, color: Colors.white),
      //         //         ),
      //         //       ),
      //         //       Center(
      //         //         child: Text(
      //         //           "Desarrollador",
      //         //           style: TextStyle(fontSize: 50, color: Colors.grey),
      //         //         ),
      //         //       ),
      //         //       Center(
      //         //         child: Text(
      //         //           "Roberto Marto Ramirez",
      //         //           style: TextStyle(fontSize: 30, color: Colors.white),
      //         //         ),
      //         //       ),
      //         //     ],
      //         //   ),
      //         // ),
      //         // Column(
      //         //   children: [
      //         //     Expanded(
      //         //       flex: 5,
      //         //       child: Container(
      //         //         // height: MediaQuery.of(context).size.height / 2,
      //         //         color: Colors.black,
      //         //         // child: Image.asset("assets/images/coding.JPG"),
      //         //       ),
      //         //     ),
      //         //     Expanded(
      //         //       flex: 5,
      //         //       child: Container(
      //         //         // height: MediaQuery.of(context).size.height / 2,
      //         //         width: 2000,
      //         //         color: Colors.indigo,
      //         //         child: Image.asset(
      //         //           "assets/images/cardbg.jpg",
      //         //           fit: BoxFit.cover,
      //         //         ),
      //         //       ),
      //         //     ),
      //         //   ],
      //         // ),
      //         HomePage(),
      //         // const MenuSection()
      //         // Transform(
      //         //     alignment: Alignment.topRight,
      //         //     transform: Matrix4.identity()
      //         //       ..setEntry(3, 2, 0.001)
      //         //       // ..translate(0.0, -25.0, 0.0)
      //         //       ..rotateY((45) * pi / 180),
      //         //     child: MyApps()),
      //       ],
      //     )
      //     ),
    );
  }
}
