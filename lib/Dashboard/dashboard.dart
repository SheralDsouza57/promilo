import 'package:flutter/material.dart';
import 'package:promilo/Account/account.dart';
import 'package:promilo/Colors/appcolors.dart';
import 'package:promilo/Explore/explore.dart';
import 'package:promilo/Home/home.dart';
import 'package:promilo/Images/app_images.dart';
import 'package:promilo/Meetup/meetup.dart';
import 'package:promilo/Prolet/prolet.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;

  final List<Widget> view = [
    const Home(),
    const Prolet(),
    const Meetup(),
    const Explore(),
    const Account(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: view[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        showUnselectedLabels: true,
        selectedItemColor: AppColors.brightBlue,
        unselectedItemColor: AppColors.black,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(Images.home),
            activeIcon: Image.asset(Images.home_active),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Images.prolet),
            activeIcon: Image.asset(
              Images.prolet_active,
            ),
            label: 'Prolet',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Images.meetup),
            activeIcon: Image.asset(Images.meetup_active),
            label: 'Meetup',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Images.explore),
            activeIcon: Image.asset(Images.explore_active),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Images.account),
            activeIcon: Image.asset(Images.account_active),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
