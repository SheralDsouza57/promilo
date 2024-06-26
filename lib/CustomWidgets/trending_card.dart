import 'package:flutter/material.dart';
import 'package:promilo/Colors/appcolors.dart';
import 'package:promilo/CustomWidgets/textwidget.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({
    super.key,
    required this.users,
    required this.profile,
    required this.title,
    required this.subtitle,
  });

  final List<String> users;
  final String profile;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(10),
      width: 280,
      height: 180,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.featherGrey),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(profile),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: title,
                    fontsize: 16,
                    fontweight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: subtitle,
                    fontsize: 13,
                    color: AppColors.grey,
                  )
                ],
              ),
            ],
          ),
          const Divider(
            color: AppColors.featherGrey,
            thickness: 1,
          ),
          Row(
            children: [
              const SizedBox(width: 10),
              for (int i = 0; i < users.length; i++)
                Align(widthFactor: 0.7, child: Image.asset(users[i]))
            ],
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 80,
              height: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.blue),
              child: const Center(
                child: TextWidget(
                  text: 'See more',
                  color: AppColors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
