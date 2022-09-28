import 'package:flutter/material.dart';

import '../themes/colors.dart';

class SimpleLoading extends StatelessWidget {
  const SimpleLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 20,
      child: Center(
        child: CircularProgressIndicator(color: AppColors.primaryColor),
      ),
    );
  }
}
