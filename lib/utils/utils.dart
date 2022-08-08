import 'package:flutter/material.dart';
import 'package:portfolio/domain/entities/apps_model.dart';
import 'package:portfolio/utils/extensions.dart';

final Map<String, String> myInfo = {
  "summary":
      """Computer Sciences Engineer (Havana, UCI, 2013), experienced in mobile development with a demonstrated history of working in the information technology and services industry. Strong engineering skills with knowledge in Java, Android, iOS, Flutter, Agile Methodologies, Databases and Cloud Services. 
      Capacity to analyze user requirements and translate customer needs into application design.
                        """,
  "skills":
      """Flutter | Swift | Android | Java | Spring Boot | Git | Firebase | AWS | Stripe | Twilio | Rest API | GraphQL | Google Maps | MapBox | Docker 
                          """,
  "training": """Advanced Mobile Development, 2015, Cuba.
Advanced management in GNU/Linux, 2014, Cuba.
Android Development,2013, Cuba.
"""
};

final List<AppsModel> myapps = [
  AppsModel(
      name: "Recreación - Cerro Negro",
      headline:
          "Aplicación diseñada para gestionar las actividades físicas-recreativas en campamento Newmont - Cerro Negro.",
      description:
          "Aplicación diseñada para gestionar las actividades físicas-recreativas en campamento Newmont - Cerro Negro.",
      icon: "icon",
      offset: 0.0,
      images: [
        "cn3.png",
        "cn2.png",
        "cn4.png",
        "cn1.png",
        "cn5.png"
      ],
      technologies:
          """Flutter GraphQL Firebase AppleHealth GoogleFit CI/CD Git""",
      colors: [
        HexColor.fromHex("345EA8"),
        HexColor.fromHex("3B8AC3"),
        HexColor.fromHex("4AB4DE"),
        // HexColor.fromHex("EEDBCB")
      ],
      storeUrls: []),
  AppsModel(
      name: "Yoel Fashion Boutique",
      headline: "",
      description:
          "Aplicación diseñada para gestionar las actividades físicas-recreativas en campamento Newmont - Cerro Negro.",
      icon: "icon",
      offset: 0.0,
      images: [
        "yf7.gif",
        "yf3.PNG",
        "yf4.PNG",
        "yf1.PNG",
        "yf2.PNG"
      ],
      technologies: """Flutter ApiRest Firebase Twilio Stripe CI/CD Git""",
      colors: [
        HexColor.fromHex("#9D50BB"),
        // HexColor.fromHex("F57D8A"),
        HexColor.fromHex("#6E48AA"),
        // HexColor.fromHex("974EC2")
      ],
      storeUrls: []),
  AppsModel(
      name: "ENTV USA",
      headline:
          "Aplicación diseñada para gestionar las actividades físicas-recreativas en campamento Newmont - Cerro Negro.",
      description:
          "Aplicación diseñada para gestionar las actividades físicas-recreativas en campamento Newmont - Cerro Negro.",
      icon: "icon",
      offset: 0.0,
      images: [
        "eu3.PNG",
        "eu2.PNG",
        "eu4.png",
        "eu1.PNG",
        "eu5.PNG"
      ],
      technologies: """Flutter ApiRest LiveStreaming Stripe CI/CD Git""",
      colors: [
        HexColor.fromHex("#5f2c82"),
        HexColor.fromHex("#49a09d"),
        // HexColor.fromHex("C27DFC"),
        // HexColor.fromHex("EEDBCB")
      ],
      storeUrls: []),
  AppsModel(
      name: "305 AutoClub",
      headline:
          "Aplicación diseñada para gestionar las actividades físicas-recreativas en campamento Newmont - Cerro Negro.",
      description:
          "Aplicación diseñada para gestionar las actividades físicas-recreativas en campamento Newmont - Cerro Negro.",
      icon: "icon",
      offset: 0.0,
      images: [
        "ac3.jpg",
        "ac2.jpg",
        "ac5.jpeg",
        "ac1.jpg",
        "ac4.jpg"
      ],
      technologies: """Flutter ApiRest Twilio Stripe CI/CD Git """,
      colors: [
        HexColor.fromHex("#1FA2FF"),
        HexColor.fromHex("#12D8FA"),
        Colors.greenAccent,
        // HexColor.fromHex("EEDBCB")
      ],
      storeUrls: []),
];

final List<Offset> cardsOffset = [
  const Offset(-30, 0.25),
  const Offset(20, -0.4),
  const Offset(20, 0.7),
  const Offset(300, -0.1),
  const Offset(350, 0.5),
  const Offset(20, -0.4),
];

final List<String> techIcons = [
  "flutter.png",
  "swift.png",
  "kotlin.png",
  "firebase.png",
  "java.png",
  "graphql.png",
  // "docker.png",
  "dart.png",
  "springboot.png",
  "html.png"
];

final List<String> contacts = [
  // "twitter.png",
  "github.png",
  "instagram.png",
  "email.png",
  "linkedin.png",
];

final List<String> moonlist = [
  // "moonlight.png",
  // "moon.png",
  "",
  "stars.png",
  // "bcloud01.png",
  "cloud01.png",

  "moon.png",
  // "cloud01.png",
  "download.png"
  // "bcloud01.png",
  // "bcloud02.png",
  // "cloud01.png",
  // "cloud02.png",
  // "cloud03.png",
];
