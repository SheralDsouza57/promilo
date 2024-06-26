import 'package:flutter/material.dart';
import 'package:promilo/CustomWidgets/custom_card.dart';
import 'package:promilo/CustomWidgets/textwidget.dart';
import 'package:promilo/CustomWidgets/trending_card.dart';
import 'package:promilo/Images/app_images.dart';
import 'package:promilo/Meetup/description.dart';
import 'package:promilo/Models/data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Meetup extends StatefulWidget {
  const Meetup({super.key});

  @override
  State<Meetup> createState() => _MeetupState();
}

class _MeetupState extends State<Meetup> {
  final PageController _pageController = PageController();

  List<String> users = [
    Images.user1,
    Images.user2,
    Images.user3,
    Images.user4,
    Images.user5
  ];

  final List<String> people = [
    Images.person1,
    Images.person2,
    Images.person3,
    Images.person4
  ];

  final List<String> title = ['Mechanic', 'Teacher', 'Driver', 'Pilot'];
  final List<String> subtitle = [
    '1,028 Meetups',
    '2,000 Meetups',
    '800 Meetups',
    '128 Meetups'
  ];

  final List<String> meetups = [
    Images.picture1,
    Images.picture2,
    Images.picture3,
    Images.picture4,
    Images.picture5,
    Images.picture6,
  ];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              leading: const Icon(Icons.arrow_back_ios),
              title: const TextWidget(
                text: 'Individual Meetup',
                fontweight: FontWeight.w500,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const SizedBox(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search_rounded),
                          suffixIcon: Icon(Icons.mic_none),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.5),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 180,
                      child: PageView(
                        controller: _pageController,
                        children: const [
                          CustomCard(
                            image: Images.meeting1,
                            text1: 'Popular Meetups',
                            text2: ' in India',
                          ),
                          CustomCard(
                            image: Images.meeting2,
                            text1: 'Popular Meetups',
                            text2: ' in Brazil',
                          ),
                          CustomCard(
                            image: Images.meeting3,
                            text1: 'Popular Meetups',
                            text2: ' in Kuwait',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 3,
                        effect: const ScrollingDotsEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          spacing: 10,
                          dotColor: Colors.grey,
                          activeDotColor: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const TextWidget(
                      text: 'Trending Popular People',
                      fontsize: 17,
                      fontweight: FontWeight.w500,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 185,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: people.length,
                        itemBuilder: (context, index) {
                          return TrendingCard(
                            users: users,
                            profile: people[index],
                            title: title[index],
                            subtitle: subtitle[index],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    const TextWidget(
                      text: 'Top Trending Meetups',
                      fontsize: 17,
                      fontweight: FontWeight.w500,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 175,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: meetups.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: Image.asset(meetups[index]),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Description(
                                    profile: profile,
                                    index: index,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
