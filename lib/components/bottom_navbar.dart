import 'dart:developer';

import 'package:brewly/components/custom_colors.dart';
import 'package:brewly/screens/fav_view.dart';
import 'package:brewly/screens/home_view.dart';
import 'package:brewly/screens/notification_view.dart';
import 'package:brewly/screens/orders_view.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    const FavView(),
    const OrdersView(),
    const NotificationView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: CustomColors().brown1,
          unselectedItemColor: CustomColors().dark,
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {
              log(selectedIndex.toString());
            });
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => _pages[0],
            //     ));
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline), label: 'Fav'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket_outlined), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Notification'),
          ]),
    );
  }
}
