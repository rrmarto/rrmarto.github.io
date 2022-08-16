import 'package:portfolio/domain/entities/apps_model.dart';

class PortfolioInfoModel {
  late String name;
  late String nameMultiLine;
  late String profession;
  late String profileImage;
  late String summary;
  late String skills;
  late String training;
  late List<AppsModel> apps;

  PortfolioInfoModel({
    required this.name,
    required this.profileImage,
    required this.profession,
    required this.nameMultiLine,
    required this.summary,
    required this.skills,
    required this.training,
    required this.apps,
  });

  @override
  String toString() {
    return """Name: $name Headline: $nameMultiLine Description: $summary 
    Icon: $skills Images: $apps """;
  }
}
