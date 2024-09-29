import 'dart:developer';

import 'package:brewly/components/button.dart';
import 'package:brewly/components/coffee_card.dart';
import 'package:brewly/components/custom_colors.dart';
import 'package:brewly/data/data.dart';
import 'package:brewly/domain/coffee_model.dart';
import 'package:brewly/functions/shopping_cart.dart';
import 'package:brewly/screens/delivery_view.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  int? selectedIndex = 0;
  final dOptions = CoffeeShopItems().dOptions;

  List<CoffeeItem> ordersList = [];
  @override
  void initState() {
    ordersList = ShoppingCart().orderedItems;
    log(ordersList.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaH = MediaQuery.of(context).size.height;
    final mediaW = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        // leading: InkWell(
        //   child: const Icon(Icons.arrow_back_ios_new),
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        // ),
        title: const Text(
          "Order",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 52,
                decoration: BoxDecoration(
                    color: CustomColors().boxBorder,
                    borderRadius: BorderRadius.circular(16)),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CoffeeFlavorCard(
                        boxWidth: (mediaW / 2) - 24,
                        onTap: () {
                          selectedIndex = index;
                          setState(() {});
                        },
                        flavorName: dOptions[index],
                        isSelected: selectedIndex == index,
                      );
                    },
                    itemCount: dOptions.length,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Delivery Address",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: CustomColors().dark,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Jl. Kpg Sutoyo",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: CustomColors().dark,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: CustomColors().lighter,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 26,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: CustomColors().dark),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.edit_location_alt_outlined,
                          size: 14,
                        ),
                        Text(
                          "Edit Address",
                          style: TextStyle(
                            fontSize: 12,
                            color: CustomColors().dark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 26,
                    width: 101,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: CustomColors().dark),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.note_add_sharp,
                          size: 14,
                        ),
                        Text(
                          "Add Note",
                          style: TextStyle(
                            fontSize: 12,
                            color: CustomColors().dark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              ordersList.isEmpty
                  ? const Text(
                      "Your Coffee Cup is empty,\nWould you like to have some\nAI suggestions?")
                  : SizedBox(
                      height: 60 * ordersList.length.toDouble(),
                      child: ListView.separated(
                        shrinkWrap: true,
                        // physics: const NeverScrollableScrollPhysics(), // Disable scrolling
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  ordersList[index].img[0],
                                  width: 54,
                                  height: 54,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    ordersList[index].name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: CustomColors().dark,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    ordersList[index].tags[0],
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: CustomColors().lighter,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10),
                              const Spacer(),
                              Row(
                                children: [
                                  InkWell(
                                    child: Image.asset(
                                      "assets/images/Icon_minus.png",
                                      width: 24,
                                      height: 24,
                                    ),
                                    onTap: () {
                                      ShoppingCart()
                                          .lessItem(ordersList[index]);
                                      setState(() {
                                        log(ShoppingCart()
                                            .orderedItems
                                            .toString());
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    ordersList[index].quantity.toString(),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      ShoppingCart().addItem(ordersList[index]);
                                      setState(() {
                                        log(ordersList.toString());
                                      });
                                    },
                                    child: Image.asset(
                                      "assets/images/Icon_plus.png",
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: ordersList.length,
                      ),
                    ),
              const SizedBox(height: 10),
              SizedBox(
                width: 327,
                height: 56,
                child: Image.asset("assets/images/Discount.png"),
              ),
              const SizedBox(height: 20),
              Text(
                "Payment Summary",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: CustomColors().dark,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      color: CustomColors().dark,
                    ),
                  ),
                  Text(
                    "\$ ${(ShoppingCart().totalCartPrice).toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: CustomColors().dark,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery Fee",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      color: CustomColors().dark,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "\$ 2.0",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      color: CustomColors().dark,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "\$ 1.0",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: CustomColors().dark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 165,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(0), top: Radius.circular(16))),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.wallet_travel_outlined,
                            weight: 20,
                            color: CustomColors().brown1,
                          ),
                          const SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Cash/Wallet",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: CustomColors().dark,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "\$ ${(ShoppingCart().totalCartPrice + 1.0).toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: CustomColors().brown1,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            weight: 20,
                            color: CustomColors().dark,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                          buttonText: "Order",
                          onTap: () {
                            ShoppingCart().orderedItems.isEmpty
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Och! your Coffee cup is empty.",
                                      ),
                                    ),
                                  )
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DeliveryView(),
                                    ),
                                  );
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
