import 'package:flutter/material.dart';

class Topic {
  final String assetImage;
  final String nameTopic;
  final Color colorCard;

  Topic({
    required this.assetImage,
    required this.nameTopic,
    required this.colorCard,
  });
}

List<Topic> listTopic = [
  Topic(
      assetImage: "",
      nameTopic: "Reduce Stress",
      colorCard: const Color(0xff808AFF)),
  Topic(
      assetImage: "",
      nameTopic: "Improve Performance",
      colorCard: const Color(0xffFA6E5A)),
  Topic(
      assetImage: "",
      nameTopic: "Increase Happiness",
      colorCard: const Color(0xffFEB18F)),
];
