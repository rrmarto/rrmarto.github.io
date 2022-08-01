//  ..................................................
//  .██████╗.██████╗.██╗......██████╗.██████╗.███████╗
//  ██╔════╝██╔═══██╗██║.....██╔═══██╗██╔══██╗██╔════╝
//  ██║.....██║...██║██║.....██║...██║██████╔╝███████╗
//  ██║.....██║...██║██║.....██║...██║██╔══██╗╚════██║
//  ╚██████╗╚██████╔╝███████╗╚██████╔╝██║..██║███████║
//  .╚═════╝.╚═════╝.╚══════╝.╚═════╝.╚═╝..╚═╝╚══════╝
//  ..................................................

import 'package:flutter/material.dart';
import 'package:portfolio/presentation/atomic_design/tokens/colors.dart';

class PortfolioColorsFoundation {
  PortfolioColorsFoundation._();

  static const Color bgGray = PortfolioColors.bgLigthGray;
  static const Color bgDark = PortfolioColors.scale06;
  static const Color colorButtonPrimary = PortfolioColors.brandPrimary;
  static const Color primaryColor = PortfolioColors.brandPrimary;
  static const MaterialColor primaryColorMat = PortfolioColors.brandPrimaryMat;
  static const Color colorButtonSecondary = PortfolioColors.brandSecondary;
  static const Color colorWhite = PortfolioColors.bgWhite;
  static const Color darkTextColors = PortfolioColors.scale06;
  static const Color ligthTextColors = PortfolioColors.scale02;
  static const Color bodyColor = PortfolioColors.scale04;
  static const Color bodyTextColor = PortfolioColors.scale04;
  static const Color cardBgColor = PortfolioColors.scale02;
  static const Color cardCircularBgColor = PortfolioColors.statusInfo;
  static const Color infoBgColor = PortfolioColors.statusInfo;
  static const Color warningBgColor = PortfolioColors.statusWarning;
  static const Color succcessBgColor = PortfolioColors.statusSuccess01;
  static const Color dangerBgColor = PortfolioColors.statusDanger01;
  static const Color errorBgColor = PortfolioColors.statusDanger02;
}
