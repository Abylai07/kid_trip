import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../constants/app_colors.dart';
import '../../parent/home_screen/home_screen.dart';
import '../../parent/parent_map/parent_map.dart';
import '../../parent/schedule_screen/calculator_screen.dart';


class DriverNavigation extends StatefulWidget {
  const DriverNavigation({super.key});

  @override
  State<DriverNavigation> createState() => _DriverNavigationState();
}

class _DriverNavigationState extends State<DriverNavigation> {
  int _selectedPage = 0;

  void onSelectPage(int index) {
    setState(() {
        _selectedPage = index;
      },
    );
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const ParentMap(),
    const CalculatorScreen(),
   // const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedPage),
      ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.white,
                iconSize: 20,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: AppColors.mainBGColor,
                color: Colors.black87,
                tabs: const [
                  GButton(
                    icon: Icons.home_filled,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.map,
                    text: 'Map',
                  ),
                  GButton(
                    icon: Icons.calendar_month,
                    text: 'Schedule',
                  ),
                  GButton(
                    icon: Icons.person_rounded,
                    text: 'Profile',
                  ),

                ],
                selectedIndex: _selectedPage,
                onTabChange: onSelectPage,
              ),
            ))),
    );
  }
}