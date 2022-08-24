import 'package:flutter/material.dart';
import 'package:portfolio/core/singleton_profile_info.dart';
import 'package:portfolio/domain/entities/contact_model.dart';
import 'package:portfolio/domain/entities/portfolio_info_model.dart';
import 'package:portfolio/presentation/atomic_design/foundations/images.dart';
import 'package:portfolio/presentation/atomic_design/foundations/texts.dart';

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
