import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meditationapp/config/color.config.dart';
import 'package:meditationapp/config/font.config.dart';
import 'package:get/get.dart';
import 'package:meditationapp/global_widget/button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            top: 0,
            child: SingleChildScrollView(
              child: Image.asset(
                "assets/image/login_bg.png",
                width: Get.width,
              ),
            ),
          ),
          Positioned(
              top: 50,
              left: 20,
              child: SingleChildScrollView(
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_circle_left_sharp,
                        size: 35, color: Colors.grey)),
              )),
          Positioned.fill(
              top: 133,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Create your account",
                        style: FontConfig.fontSignIn
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 33,
                      ),
                      SizedBox(
                          width: Get.width,
                          height: 63,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xff7583CA),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(38)),
                            ),
                            onPressed: () {},
                            icon: const FaIcon(FontAwesomeIcons.facebookF),
                            label: const Text(
                              "Continue with Facebook",
                              style: TextStyle(
                                letterSpacing: 2,
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: Get.width,
                          height: 63,
                          child: OutlinedButton.icon(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(38)),
                            ),
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.red,
                            ),
                            label: const Text(
                              "Continue with Google",
                              style: TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.normal),
                            ),
                          )),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "OR LOG IN WITH EMAIL",
                        style: FontConfig.fontSmall14.copyWith(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xffA1A4B2)),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            fillColor: Color(0xffF2F3F7),
                            filled: true,
                            hintText: "Full Name",
                            hintStyle: FontConfig.fontSmall16Light,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            fillColor: Color(0xffF2F3F7),
                            filled: true,
                            hintText: "Email address",
                            hintStyle: FontConfig.fontSmall16Light,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            fillColor: Color(0xffF2F3F7),
                            filled: true,
                            hintText: "Password",
                            hintStyle: FontConfig.fontSmall16Light,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Button(text: "Sign Up", onTap: () {}),
                      const SizedBox(
                        height: 20,
                      ),
                      // RichText(
                      //     text: TextSpan(children: [
                      //   TextSpan(
                      //       text: "Already have an account? ",
                      //       style: FontConfig.fontSmall14Medium.copyWith(
                      //           fontWeight: FontWeight.w300,
                      //           color: Colors.black)),
                      //   TextSpan(
                      //       recognizer: TapGestureRecognizer()
                      //         ..onTap = () {
                      //           Navigator.push(
                      //               context,
                      //               MaterialPageRoute(
                      //                   builder: (context) => const SignIn()));
                      //         },
                      //       text: "Sign up",
                      //       style: FontConfig.fontSmall16.copyWith(
                      //           color: ColorConfig.primaryColor,
                      //           fontWeight: FontWeight.w600))
                      // ]))
                    ],
                  ),
                ),
              ))
        ],
      )),
    );
  }
}
