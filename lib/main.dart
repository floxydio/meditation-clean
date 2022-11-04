import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditationapp/presentasion/play/playmusic.main.dart';
import 'package:meditationapp/presentasion/welcome/welcome.screen.dart';

void main() => runApp(const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meditation",
      home: PlayMain(),
    ));
