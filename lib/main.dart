import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditationapp/navbar/navbar_main.dart';


void main() => runApp(const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meditation",
      home: MainNavBar(),
    ));
