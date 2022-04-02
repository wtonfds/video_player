import 'package:flutter/material.dart';
import 'package:seventh_player/cores/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: AppColors.grey,
    );
  }
}
