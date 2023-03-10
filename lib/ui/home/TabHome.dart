import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviemania/models/moviesmodel.dart';
import 'package:moviemania/ui/home/HomePage.dart';
import 'package:moviemania/ui/Upcoming.dart';
import 'package:moviemania/ui/PopularMovies.dart';
import 'package:moviemania/ui/topRated.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class TabHome extends StatelessWidget {

   TabHome({Key? key}) : super(key: key);
  late PersistentTabController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = PersistentTabController(initialIndex: 2);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.amber
    ));
    return PersistentTabView(
      context,
      controller: _controller,
      navBarHeight: 70,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}
List<Widget> _buildScreens() {
  return [

    MovieList(),
    TopRatedMovies(),
    const HomePage(),
    UpcomingMovies(),
    UpcomingMovies(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [

    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.arrow_2_circlepath),
      title: ("Popular"),
      activeColorPrimary: Colors.amber,
      inactiveColorPrimary: CupertinoColors.black,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.star),
      title: ("Top Rated"),
      activeColorPrimary: Colors.amber,
      inactiveColorPrimary: CupertinoColors.black,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.home),
      title: ("Home"),
      activeColorPrimary: Colors.amber,
      inactiveColorPrimary: CupertinoColors.black,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.download_circle),
      title: ("Upcoming"),
      activeColorPrimary: Colors.amber,
      inactiveColorPrimary: CupertinoColors.black,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.cube),
      title: ("Genres"),
      activeColorPrimary: Colors.amber,
      inactiveColorPrimary: CupertinoColors.black,
    ),
  ];
}

