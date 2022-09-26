import 'package:flutter/material.dart';

import '../themes/colors.dart';
import 'common_text.dart';


class CommonButtonForLogin extends StatelessWidget {
  const CommonButtonForLogin(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: media.height * 0.06,
        width: media.width * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: AppColors.secondaryColor,
        ),
        child: Center(
            child: CommonText(
              text: text,
              color: AppColors.primaryColor,
            )),
      ),
    );
  }
}

class CommonButton extends StatelessWidget {
  const CommonButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: media.height * 0.06,
        width: media.width,
        margin: const EdgeInsets.only(right: 15.0, left: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.primaryColor,
        ),
        child: Center(
            child: CommonText(
              text: text,
              color: AppColors.secondaryColor,
            )),
      ),
    );
  }
}

