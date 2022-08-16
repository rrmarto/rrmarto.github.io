import 'package:flutter/material.dart';

class AppsModel {
  late String name;
  late String headline;
  late String description;
  late String icon;
  late double offset;
  late List<String> images;
  late String technologies;
  late List<Color> colors;
  late List<String> storeUrls;

  AppsModel({
    required this.name,
    required this.headline,
    required this.description,
    required this.icon,
    required this.offset,
    required this.images,
    required this.technologies,
    required this.colors,
    required this.storeUrls,
  });

  @override
  String toString() {
    return """Name: $name Headline: $headline Description: $description 
    Icon: $icon Images: $images Colors: $colors StoreUrls: $storeUrls""";
  }
}
