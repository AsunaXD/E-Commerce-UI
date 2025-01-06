import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:e_commerce_ui/SCreens/cart_screen.dart';
import 'package:e_commerce_ui/SCreens/favourits_screen.dart';
import 'package:e_commerce_ui/SCreens/home_screen.dart';
import 'package:e_commerce_ui/SCreens/product_screen.dart';
import 'package:e_commerce_ui/SCreens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Highlighted import for QR scanner
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

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

  // // Highlighted: Function to handle QR scanning
  // Future<void> _startQRScanner() async {
  //   try {
  //     final scanResult = await FlutterBarcodeScanner.scanBarcode(
  //       '#ff6666', // Color of the scanning line
  //       'Cancel', // Cancel button text
  //       true, // Show flash icon
  //       ScanMode.QR, // Scan mode (QR)
  //     );

  //     if (scanResult != '-1') {
  //       // Handle scanned result if not canceled
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Scanned: $scanResult')),
  //       );
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Error scanning: $e')),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      floatingActionButton: SafeArea(
        child: FloatingActionButton(
          onPressed: () {}, // Highlighted: Updated onPressed
          shape: CircleBorder(),
          child: Icon(
            Icons.qr_code,
            color: Colors.white,
            size: 20,
          ),
          backgroundColor: Color(0xFFEF6969),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          CupertinoIcons.home,
          CupertinoIcons.cart,
          CupertinoIcons.heart,
          CupertinoIcons.profile_circled,
        ],
        inactiveColor: Colors.black.withOpacity(0.5),
        activeColor: Color(0xFFEF6969),
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
