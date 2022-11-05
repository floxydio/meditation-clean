import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditationapp/presentasion/home/home.main.dart';
import 'package:meditationapp/presentasion/home/screens/home.screen.dart';
import 'package:meditationapp/presentasion/play/play_screen.dart';
import 'package:meditationapp/presentasion/topic/screens/topic.screen.dart';
import 'package:meditationapp/presentasion/welcome/welcome.screen.dart';

void main() => runApp(const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meditation",
      home: HomeMain(),
    ));
