import 'package:flutter/material.dart';

class Topic {
  final num mainAxis;
  final String assetImage;
  final String nameTopic;
  final Color colorCard;

  Topic({
    required this.mainAxis,
    required this.assetImage,
    required this.nameTopic,
    required this.colorCard,
  });
}

List<Topic> listTopic = [
  Topic(
      mainAxis: 2,
      assetImage: "assets/image/reduce-img.png",
      nameTopic: "Reduce Stress",
      colorCard: const Color(0xff808AFF)),
  Topic(
    mainAxis: 1,
      assetImage: "assets/image/improve-img.png",
      nameTopic: "Improve Performance",
      colorCard: const Color(0xffFA6E5A)),
  Topic(
    mainAxis: 2,
      assetImage: "assets/image/increase-img.png",
      nameTopic: "Increase Happiness",
      colorCard: const Color(0xffFEB18F)),
  Topic(

      mainAxis: 1,
      assetImage: "assets/image/recude2-img.png", nameTopic: "Reduce Anxiety", colorCard: const Color(0xffFFCF86)),
  Topic(
      mainAxis: 2,
      assetImage: "assets/image/personal-img.png", nameTopic: "Personal\nGrowth", colorCard: const Color(0xff6CB28E)),
  Topic(
      mainAxis: 2,
      assetImage: "assets/image/sleep.png", nameTopic: "Better Sleep", colorCard: const Color(0xff3F414E))
];

