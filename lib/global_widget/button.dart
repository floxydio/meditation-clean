import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditationapp/config/color.config.dart';
import 'package:meditationapp/config/font.config.dart';

class Button extends StatelessWidget {
  final String text;
  final bool isPaddingOn;

  final Function()? onTap;
  final Color color;
  final Color textColor;
  const Button(
      {Key? key,
      required this.text,
      required this.onTap,
      this.color = ColorConfig.primaryColor,
      this.textColor = const Color(0xffF6F1FB),
      this.isPaddingOn = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 63,
      child: Padding(
        padding: isPaddingOn == false
            ? const EdgeInsets.all(0)
            : const EdgeInsets.only(left: 20.0, right: 20.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(38),
            ),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: FontConfig.fontSmall14
                .copyWith(color: textColor, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
