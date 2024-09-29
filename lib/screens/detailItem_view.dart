import 'dart:developer';

import 'package:brewly/components/button.dart';
import 'package:brewly/components/coffee_card.dart';
import 'package:brewly/components/custom_colors.dart';
import 'package:brewly/data/data.dart';
import 'package:brewly/domain/coffee_model.dart';
import 'package:brewly/functions/shopping_cart.dart';
import 'package:brewly/screens/orders_view.dart';
import 'package:flutter/material.dart';

class DetailitemView extends StatefulWidget {
  // final Map<String, dynamic> selectedItem;
  final CoffeeItem coffeeData;
 bool isFavourite;// Expect the whole item

   DetailitemView({super.key , required this.isFavourite , required this.coffeeData});

  @override
  State<DetailitemView> createState() => _DetailitemViewState();
}

class _DetailitemViewState extends State<DetailitemView> {
  final ShoppingCart _shoppingCart = ShoppingCart();


  // void addToOrders(Map<String, dynamic> item) {
  //   setState(() {
  //     CoffeeShopItems().orderedItems.add(item); // Add item to the orders list
  //   });
  //   log("${item['name']} added to orders");
  // }

  int? selectedSizeIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    selectedSizeIndex = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaH = MediaQuery.of(context).size.height;
    final mediaW = MediaQuery.of(context).size.width;
    final List<String> sizes = CoffeeShopItems().sizes;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: InkWell(
          child: const Icon(Icons.arrow_back_ios_new),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Detail",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          InkWell(
              onTap: () {

                if (!CoffeeShopItems().favoriteItems.contains(widget.coffeeData)) {
                  setState(() {
                    CoffeeShopItems()
                        .favoriteItems
                        .add(widget.coffeeData); // Add item to the favorites list
                  });
                  log("${widget.coffeeData.name} added to favorites");
                } else {
                  CoffeeShopItems().favoriteItems.remove(widget.coffeeData);
                  log("${widget.coffeeData.name} is already in favorites");
                }
                setState(() {});
              },
              child: Icon(
                CoffeeShopItems()
                    .favoriteItems
                    .contains(widget.coffeeData) == true ? Icons.favorite :Icons.favorite_border , // Unselected favorite icon
                color: Colors.redAccent,
              ),),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: mediaW, // 80% of the screen width
                  height: mediaH * 0.3, // 40% of the screen height
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      widget.coffeeData.img[0], // Display the item's image
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.left,
                        widget.coffeeData.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: CustomColors().dark,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.coffeeData.tags[0],
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: CustomColors().lightgrey),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "⭐ 4.8",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: CustomColors().dark,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/Fast Delivery.png"),
                      Image.asset("assets/images/Quality Bean.png"),
                      Image.asset("assets/images/Extra Milk.png"),
                    ],
                  )
                ],
              ),
              const Divider(),
              Text(
                textAlign: TextAlign.start,
                "Description",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: CustomColors().dark,
                ),
              ),
              Text(
                widget.coffeeData.description,
                style: TextStyle(
                  fontSize: 14,
                  color: CustomColors().lightgrey,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Size",
                style: TextStyle(
                  color: CustomColors().dark,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // Ensure you return the widget here
                    return CoffeeFlavorCard(
                      isSelected: selectedSizeIndex == index,
                      onTap: () {
                        selectedSizeIndex = index;
                        log(index.toString());
                        log('Tap on ${sizes[index]}');
                        setState(() {});
                      },
                      flavorName: sizes[index],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width:
                        20, // Use width instead of height for horizontal spacing
                  ),
                  itemCount: sizes.length,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(color: CustomColors().lighter),
                      ),
                      Text(
                        '\$ ${selectedSizeIndex ==0 ? widget.coffeeData.price.toStringAsFixed(2) :selectedSizeIndex ==1  ? (1.5+ widget.coffeeData.price).toStringAsFixed(2) :  (2.5+ widget.coffeeData.price).toStringAsFixed(2)}', // Display formatted price
                        // '\$ ${widget.coffeeData.price.toStringAsFixed(2)}', // Display formatted price
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: CustomColors().brown1,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomButton(
                        buttonWidth: 200,
                        buttonText: "Buy Now",
                        onTap: () {
                          // addToOrders(widget.selectedItem);
                          ShoppingCart().addItem(widget.coffeeData);
                          log(_shoppingCart.orderedItems.toString());
                          setState(() {});
                          // log(CoffeeShopItems().orderedItems.toString());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrdersView(),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
