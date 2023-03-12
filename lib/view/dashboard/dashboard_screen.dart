// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:barbar_booking_app/res/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreen() {
    return [
      const Scaffold(
          body: Center(
        child: Text('home'),
      )),
      const Scaffold(
        body: Center(
          child: Text('search'),
        ),
      ),
      const Scaffold(
        body: Center(
          child: Text('add post screen'),
        ),
      ),
      const Scaffold(
          body: Center(
        child: Text('user list'),
      )),
      const Scaffold(
          body: Center(
        child: Text('profile screen'),
      )),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.home, color: AppColors.secondaryColor),
          inactiveIcon: Icon(Icons.home, color: Colors.grey.shade100),
          activeColorPrimary: AppColors.primaryIconColor),
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.search,
              color: AppColors.secondaryColor),
          activeColorPrimary: AppColors.primaryIconColor,
          inactiveIcon:
              Icon(CupertinoIcons.search, color: Colors.grey.shade100)),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.add, color: AppColors.secondaryColor),
          activeColorPrimary: AppColors.secondaryColor,
          inactiveIcon: Icon(Icons.add, color: Colors.grey.shade100)),
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.chat_bubble_2,
              color: AppColors.secondaryColor),
          inactiveIcon:
              Icon(CupertinoIcons.chat_bubble_2, color: Colors.grey.shade100),
          activeColorPrimary: AppColors.primaryIconColor),
      PersistentBottomNavBarItem(
          icon:
              const Icon(Icons.person_outline, color: AppColors.secondaryColor),
          inactiveIcon: Icon(Icons.person_outline, color: Colors.grey.shade100),
          activeColorPrimary: AppColors.primaryIconColor),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreen(),
      items: _navBarItems(),
      confineInSafeArea: true,
      backgroundColor: AppColors.otpHintColor, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }
}