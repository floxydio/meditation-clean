import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meditationapp/config/font.config.dart';
import 'package:meditationapp/global_widget/button.dart';
import 'package:meditationapp/presentasion/auth/screen/boarding_auth.screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff8E97FD),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(
                  child: Image.asset(
                "assets/image/logo.png",
                width: 168,
                height: 30,
              )),
              const SizedBox(
                height: 70,
              ),
              Text("Hi Dio, Welcome",
                  style: FontConfig.fontLarge.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Text("to Silent Moon",
                  style: FontConfig.fontLarge.copyWith(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w300)),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 49.0, right: 49.0),
                child: Text(
                  "Explore the app, Find some peace of mind to prepare for meditation.",
                  textAlign: TextAlign.center,
                  style: FontConfig.fontSmall16.copyWith(color: Colors.white),
                ),
              ),
              Stack(
                children: [
                  Positioned(child: Image.asset("assets/image/welcome_bg.png")),
                  Positioned(
                      bottom: 74,
                      child: Button(
                          textColor: Colors.black,
                          color: const Color(0xffEBEAEC),
                          isPaddingOn: true,
                          text: "Get Started",
                          onTap: () {
                            Get.off(const BoardingAuth());
                          }))
                ],
              )
            ],
          )),
        ));
  }
}
