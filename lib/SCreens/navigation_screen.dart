import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:e_commerce_ui/SCreens/cart_screen.dart';
import 'package:e_commerce_ui/SCreens/favourits_screen.dart';
import 'package:e_commerce_ui/SCreens/home_screen.dart';
import 'package:e_commerce_ui/SCreens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0;
  List<Widget> pages = [
    Homescreen(),
    CartScreen(),
    FavouritsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          CupertinoIcons.home,
          CupertinoIcons.cart,
          CupertinoIcons.heart,
          CupertinoIcons.profile_circled,
        ],
        // splashColor: ,
        inactiveColor: Colors.black.withOpacity(0.5),
        gapLocation: GapLocation.center,
        activeIndex: pageIndex,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        iconSize: 25,
        elevation: 0,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
    );
  }
}
