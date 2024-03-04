import 'package:expenser/screens/home_screen.dart';
import 'package:expenser/screens/tasks_screen.dart';
import 'package:flutter/material.dart';
import 'package:expenser/auth.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'screens/settings_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 1;
  DataAuth db = DataAuth();
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const <Widget>[
          TasksScreen(),
          HomeScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: WaterDropNavBar(
        waterDropColor: const Color(0xff5d74ef),
        barItems: [
          BarItem(
              filledIcon: FluentIcons.list_16_filled,
              outlinedIcon: FluentIcons.list_16_regular),
          BarItem(
              filledIcon: FluentIcons.home_12_filled,
              outlinedIcon: FluentIcons.home_12_regular),
          BarItem(
              filledIcon: FluentIcons.money_16_filled,
              outlinedIcon: FluentIcons.money_16_regular),
        ],
        selectedIndex: selectedIndex,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
          pageController.animateToPage(selectedIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutQuad);
        },
      ),
    );
  }
}
