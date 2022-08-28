import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/core/singleton_profile_info.dart';
import 'package:portfolio/domain/entities/contact_model.dart';
import 'package:portfolio/domain/entities/portfolio_info_model.dart';
import 'package:portfolio/presentation/atomic_design/foundations/images.dart';
import 'package:portfolio/presentation/atomic_design/foundations/texts.dart';
import 'package:portfolio/presentation/sections/cv_section.dart';
import 'package:url_launcher/url_launcher.dart';

final PortfolioInfoModel myInfo = ProfileInfo.myinfo.data;

final List<Offset> cardsOffset = [
  const Offset(-30, 0.25),
  const Offset(20, -0.4),
  const Offset(20, 0.7),
  const Offset(300, -0.1),
  const Offset(350, 0.5),
  const Offset(20, -0.4),
];

final List<String> techIcons = [
  PortfolioImagesFoundation.flutterTechnologyImage,
  PortfolioImagesFoundation.swiftTechnologyImage,
  PortfolioImagesFoundation.kotlinTechnologyImage,
  PortfolioImagesFoundation.firebaseTechnologyImage,
  PortfolioImagesFoundation.javaTechnologyImage,
  PortfolioImagesFoundation.graphqlTechnologyImage,
  PortfolioImagesFoundation.dartTechnologyImage,
  PortfolioImagesFoundation.springbootTechnologyImage,
  PortfolioImagesFoundation.htmlTechnologyImage,
];

final List<ContactModel> contacts = [
  // "twitter.png",
  ContactModel(
      image: PortfolioImagesFoundation.githubImage,
      url: PortfolioTextsFoundation.githubURL),
  ContactModel(
      image: PortfolioImagesFoundation.instagramImage,
      url: PortfolioTextsFoundation.instagramURL),
  ContactModel(
      image: PortfolioImagesFoundation.emailImage,
      url: PortfolioTextsFoundation.emailAddress),
  ContactModel(
      image: PortfolioImagesFoundation.linkedinImage,
      url: PortfolioTextsFoundation.linkedInURL),
];

//Routes
const String firstScreen = '/';
const String homePage = '/homePage';
const String settingsRoute = '/menu';

showPDFPreview(BuildContext context) {
  AlertDialog alert = const AlertDialog(
    insetPadding: EdgeInsets.all(0),
    contentPadding: EdgeInsets.all(0),
    content: CVSection(),
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Future<Uint8List> generatePdf(format) async {
  ByteData bytes = await rootBundle.load('assets/cv/cv.pdf');
  Uint8List cvList =
      bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  List<int> cvListInt = cvList.cast<int>();
  return cvList;
}

downloadCV() async {
  ByteData bytes = await rootBundle.load('assets/cv/cv.pdf');
  Uint8List cvList =
      bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  List<int> cvListInt = cvList.cast<int>();
  launchUrl(Uri.parse(
      "data:application/octet-stream;base64,${base64Encode(cvListInt)}"));
}

downloadFromGithub() {
  launchUrl(Uri.parse(
      "https://github.com/rrmarto/rrmarto.github.io/raw/master/assets/cv/cv.pdf"));
}
