import 'dart:developer';

import 'package:brewly/components/custom_colors.dart';
import 'package:brewly/data/global.dart';
import 'package:brewly/functions/shopping_cart.dart';
import 'package:brewly/screens/orders_view.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class CartBage extends StatelessWidget {
  const CartBage({super.key});

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: 0, end: 3),
      badgeAnimation: const badges.BadgeAnimation.slide(),

      // onTap: () {},
      badgeStyle: badges.BadgeStyle(
        badgeColor: CustomColors().brown1,
      ),
      // badgeContent:
      //     // Text(
      //     //   cartItemQty.toString(),
      //     // ),
      //     Text(ShoppingCart().orderedItems.length.toString()),
      child: IconButton(
        onPressed: () {
          log("Cart Icon Pressed");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const OrdersView(),
            ),
          );
        },
        icon: const Icon(
          Icons.coffee_sharp,
          // size: 28,
        ),
        color: Colors.white,
      ),
    );
  }
}
