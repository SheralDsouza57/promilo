import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:promilo/Colors/appcolors.dart';
import 'package:promilo/CustomWidgets/textwidget.dart';
import 'package:promilo/Models/data.dart';
import 'package:promilo/Models/profile_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Description extends StatefulWidget {
  final ProfileModel profile;
  final int index;
  const Description({super.key, required this.profile, required this.index});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  List<Icon> icons = [
    const Icon(
      Icons.download_rounded,
      color: AppColors.justGrey,
      size: 30,
    ),
    const Icon(
      Icons.bookmark_border,
      color: AppColors.justGrey,
      size: 30,
    ),
    const Icon(
      Icons.favorite_outline_rounded,
      color: AppColors.justGrey,
      size: 30,
    ),
    const Icon(
      Icons.center_focus_strong_outlined,
      color: AppColors.black,
      size: 30,
    ),
    const Icon(
      Icons.star_border,
      color: AppColors.black,
      size: 30,
    ),
  ];

  Future<void> _shareContent() async {
    await FlutterShare.share(
      title: 'Share Example',
      text: 'Check out this content!',
      linkUrl: 'https://github.com/SheralDsouza57?tab=repositories',
      chooserTitle: 'Share via',
    );
  }

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        title: const TextWidget(
          text: 'Description',
          fontweight: FontWeight.w500,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Container(
                height: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.lightGrey),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 355,
                          child: PageView(
                            controller: _pageController,
                            children: [
                              for (int i = 0; i < 4; i++)
                                Image.asset(
                                  profile.snaps[widget.index][i],
                                  fit: BoxFit.contain,
                                ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 25,
                          left: 130,
                          child: SmoothPageIndicator(
                            controller: _pageController,
                            count: 4,
                            effect: const ScrollingDotsEffect(
                              dotHeight: 12,
                              dotWidth: 12,
                              spacing: 10,
                              dotColor: Colors.grey,
                              activeDotColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (int i = 0; i < icons.length; i++) icons[i],
                        InkWell(
                          onTap: () {
                            _shareContent();
                          },
                          child: const Icon(
                            Icons.share_outlined,
                            color: AppColors.black,
                            size: 30,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(
                    Icons.bookmark_border,
                    color: AppColors.blue,
                  ),
                  TextWidget(
                    text: profile.bookmark[widget.index],
                    color: AppColors.grey,
                    fontweight: FontWeight.w500,
                  ),
                  const SizedBox(width: 20),
                  const Icon(
                    Icons.favorite_border,
                    color: AppColors.blue,
                  ),
                  TextWidget(
                    text: profile.likes[widget.index],
                    color: AppColors.grey,
                    fontweight: FontWeight.w500,
                  ),
                  const SizedBox(width: 20),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.lightGrey),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 20,
                          color: AppColors.brightBlue,
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.star,
                          size: 20,
                          color: AppColors.brightBlue,
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.star,
                          size: 20,
                          color: AppColors.brightBlue,
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.star,
                          size: 20,
                          color: AppColors.justGrey,
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.star,
                          size: 20,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  TextWidget(
                    text: profile.ratings[widget.index],
                    color: AppColors.blue,
                    fontweight: FontWeight.w500,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextWidget(
                text: profile.actorNames[widget.index],
                fontweight: FontWeight.w500,
                fontsize: 17,
              ),
              TextWidget(
                text: profile.profession[widget.index],
                fontsize: 15,
                color: AppColors.grey,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.access_time_outlined,
                    color: AppColors.grey,
                  ),
                  const SizedBox(width: 5),
                  TextWidget(
                    text: profile.duration[widget.index],
                    fontsize: 16,
                    color: AppColors.grey,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.account_balance_wallet_outlined,
                    color: AppColors.grey,
                  ),
                  const SizedBox(width: 5),
                  TextWidget(
                    text: profile.fees[widget.index],
                    fontsize: 16,
                    color: AppColors.grey,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const TextWidget(
                text: 'About',
                fontweight: FontWeight.w500,
                fontsize: 17,
              ),
              TextWidget(
                text: profile.about[widget.index],
                fontsize: 16,
                color: AppColors.grey,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.bottomRight,
                child: TextWidget(
                  text: 'See More',
                  fontsize: 15,
                  color: AppColors.blue,
                  fontweight: FontWeight.w500,
                  textAlign: TextAlign.right,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
