import 'package:portfolio/domain/entities/apps_model.dart';
import 'package:portfolio/domain/entities/portfolio_info_model.dart';
import 'package:portfolio/presentation/atomic_design/foundations/colors.dart';
import 'package:portfolio/presentation/atomic_design/foundations/images.dart';
import 'package:portfolio/presentation/atomic_design/foundations/texts.dart';

class ProfileInfo {
  late final PortfolioInfoModel _data;
  ProfileInfo() {
    _data = PortfolioInfoModel(
        name: PortfolioTextsFoundation.myName,
        nameMultiLine: PortfolioTextsFoundation.myNameMultiLine,
        profession: PortfolioTextsFoundation.portfolioProfession,
        profileImage: PortfolioImagesFoundation.profilePictureImage,
        summary: PortfolioTextsFoundation.portfolioSummary,
        skills: PortfolioTextsFoundation.portfolioSkills,
        training: PortfolioTextsFoundation.portfolioTraining,
        apps: [
          AppsModel(
              name: PortfolioTextsFoundation.nameAppDoreSite,
              headline: PortfolioTextsFoundation.descriptionAppDoreSite,
              description: PortfolioTextsFoundation.descriptionAppDoreSite,
              icon: "icon",
              offset: 0.0,
              images: [
                PortfolioImagesFoundation.doreSiteImage1,
                PortfolioImagesFoundation.doreSiteImage2,
                PortfolioImagesFoundation.doreSiteImage3,
                PortfolioImagesFoundation.doreSiteImage4,
                PortfolioImagesFoundation.doreSiteImage5,
              ],
              technologies: PortfolioTextsFoundation.technologiesAppDoreSite,
              colors: [
                PortfolioColorsFoundation.doreSiteColor1,
                PortfolioColorsFoundation.doreSiteColor2,
                PortfolioColorsFoundation.doreSiteColor3,
              ],
              storeUrls: [
                "https://apps.apple.com/app/recreaci%C3%B3n-cerro-negro/id1616790457",
                "https://apps.apple.com/app/recreaci%C3%B3n-cerro-negro/id1616790457"
              ]),
          AppsModel(
              name: PortfolioTextsFoundation.nameAppYoelFashion,
              headline: PortfolioTextsFoundation.descriptionAppYoelFashion,
              description: PortfolioTextsFoundation.descriptionAppYoelFashion,
              icon: "icon",
              offset: 0.0,
              images: [
                PortfolioImagesFoundation.yoelFashionImage1,
                PortfolioImagesFoundation.yoelFashionImage2,
                PortfolioImagesFoundation.yoelFashionImage3,
                PortfolioImagesFoundation.yoelFashionImage4,
                PortfolioImagesFoundation.yoelFashionImage5,
              ],
              technologies: PortfolioTextsFoundation.technologiesAppYoelFashion,
              colors: [
                PortfolioColorsFoundation.yoelFashionColor1,
                PortfolioColorsFoundation.yoelFashionColor2,
              ],
              storeUrls: [
                "https://play.google.com/store/apps/details?id=com.yoelmiamifashion.store&hl=en&gl=US",
                "https://apps.apple.com/es/app/yoel-fashion-boutique/id1564620714"
              ]),
          AppsModel(
              name: PortfolioTextsFoundation.nameAppEnTvUsa,
              headline: PortfolioTextsFoundation.descriptionAppEnTvUsa,
              description: PortfolioTextsFoundation.descriptionAppEnTvUsa,
              icon: "icon",
              offset: 0.0,
              images: [
                PortfolioImagesFoundation.entvUsaImage1,
                PortfolioImagesFoundation.entvUsaImage2,
                PortfolioImagesFoundation.entvUsaImage3,
                PortfolioImagesFoundation.entvUsaImage4,
                PortfolioImagesFoundation.entvUsaImage5,
              ],
              technologies: PortfolioTextsFoundation.technologiesAppEnTvUsa,
              colors: [
                PortfolioColorsFoundation.entvUsaColor1,
                PortfolioColorsFoundation.entvUsaColor2,
              ],
              storeUrls: [
                "https://play.google.com/store/apps/details?id=com.entvusa.app&hl=en&gl=US",
                "https://apps.apple.com/py/app/entv-usa/id1558527240"
              ]),
          AppsModel(
              name: PortfolioTextsFoundation.nameAppAutoClub,
              headline: PortfolioTextsFoundation.descriptionAppAutoClub,
              description: PortfolioTextsFoundation.descriptionAppAutoClub,
              icon: "icon",
              offset: 0.0,
              images: [
                PortfolioImagesFoundation.autoClubImage1,
                PortfolioImagesFoundation.autoClubImage2,
                PortfolioImagesFoundation.autoClubImage3,
                PortfolioImagesFoundation.autoClubImage4,
                PortfolioImagesFoundation.autoClubImage5,
              ],
              technologies: PortfolioTextsFoundation.technologiesAppAutoClub,
              colors: [
                PortfolioColorsFoundation.autoClubColor1,
                PortfolioColorsFoundation.autoClubColor2,
              ],
              storeUrls: [
                "https://play.google.com/store/apps/details?id=com.autoclub.app&hl=en&gl=US",
                "https://apps.apple.com/es/app/305-autoclub/id1559806085"
              ]),
        ]);
  }
  static final ProfileInfo _singleton = ProfileInfo();

  static ProfileInfo get myinfo => _singleton;

  PortfolioInfoModel get data => _data;
}
