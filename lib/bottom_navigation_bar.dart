import 'package:BodyPower/features/user/presentation/screens/home_page.dart';
import 'package:BodyPower/features/news_page/presentation/screens/news_screen.dart';
import 'package:BodyPower/features/blogger/presentation/screens/timetable_page.dart';
import 'package:BodyPower/features/user/presentation/screens/sign_up_screen.dart';
import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/achievement_screen/presentation/screens/achievements_screen.dart';
import 'features/user/presentation/screens/profile_screen.dart';
import 'internal/custom_appbar.dart';
import 'internal/helpers/text_helper.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedTab = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePageScreen(),
    AchievementsScreen(),
    TimeTableScreen(),
    NewsScreen(),
  ];

  void onSelectTab(int index) {
    if (_selectedTab == index) return;

    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: ColorHelper.backgroundColor,
      body: _widgetOptions[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedTab,
        selectedItemColor: ColorHelper.green90E072,
        unselectedItemColor: ColorHelper.grey878787,
        backgroundColor: ColorHelper.black101010,
        onTap: onSelectTab,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage("assets/icons/home_icon.png"),
              size: 24.r,
            ),
            label: "Главная",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage("assets/icons/achievements_icon.png"),
              size: 24.r,
            ),
            label: "Достижения",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage("assets/icons/courses_icon.png"),
              size: 24.r,
            ),
            label: "Курсы",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage("assets/icons/news_icon.png"),
              size: 24.r,
            ),
            label: "Новости",
          ),
        ],
      ),
    );
  }
}
