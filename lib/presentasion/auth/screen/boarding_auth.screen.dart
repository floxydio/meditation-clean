import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meditationapp/config/color.config.dart';
import 'package:meditationapp/config/font.config.dart';
import 'package:meditationapp/presentasion/auth/screen/signin_auth.screen.dart';
import 'package:meditationapp/presentasion/auth/screen/signup_auth.screen.dart';

class BoardingAuth extends StatefulWidget {
  const BoardingAuth({Key? key}) : super(key: key);

  @override
  State<BoardingAuth> createState() => _BoardingAuthState();
}

class _BoardingAuthState extends State<BoardingAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            child: Image.asset("assets/image/auth_bg.png"),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "We are what we do",
            style: FontConfig.fontLarge,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Thousand of people are using silent moon for\nsmalls meditation",
            style: FontConfig.fontSmall16Light,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: SizedBox(
                height: 62,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: ColorConfig.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(38),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()));
                    },
                    child: const Text("SIGN UP"))),
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "Already have an account? ",
                style: FontConfig.fontSmall14Medium.copyWith(
                    fontWeight: FontWeight.w300, color: Colors.black)),
            TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignIn()));
                  },
                text: "Sign in",
                style: FontConfig.fontSmall16.copyWith(
                    color: ColorConfig.primaryColor,
                    fontWeight: FontWeight.w600))
          ]))
        ],
      )),
    );
  }
}
