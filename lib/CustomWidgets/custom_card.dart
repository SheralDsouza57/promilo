import 'package:flutter/material.dart';
import 'package:promilo/Colors/appcolors.dart';
import 'package:promilo/CustomWidgets/textwidget.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.image,
    required this.text1,
    required this.text2,
  });
  final String image;
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 180,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.asset(
            image,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 14.0,
          left: 25.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: text1,
                color: AppColors.white,
                fontsize: 17,
                fontweight: FontWeight.w500,
              ),
              TextWidget(
                text: text2,
                color: AppColors.white,
                fontsize: 17,
                fontweight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
