import 'dart:developer';

import 'package:brewly/components/button.dart';
import 'package:brewly/components/cart_bage.dart';
import 'package:brewly/components/coffee_card.dart';
import 'package:brewly/components/custom_colors.dart';
import 'package:brewly/components/item_card.dart';
import 'package:brewly/data/data.dart';
import 'package:brewly/domain/coffee_model.dart';
import 'package:brewly/functions/shopping_cart.dart';
import 'package:brewly/screens/detailItem_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedFlavorIndex = 0;
  List<CoffeeItem> items = CoffeeShopItems().itemList;
  String? selectedCategory;
  List<CoffeeItem> filteredItems = []; // Filtered coffee list
  List coffeeFlavors = CoffeeShopItems().coffeeFlavors;

  @override
  void initState() {
    // TODO: implement initState
    filteredItems = items; // Initially display all items

    super.initState();
  }

  void filterItemsByCategory(String? category) {
    if (category == null || category == 'All Coffee') {
      filteredItems = items; // Show all items if no category is selected
    } else {
      filteredItems = items.where((item) => item.category == category).toList();
    }
    setState(() {}); // Update the UI
  }

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    final appBarH = mediaHeight * 0.35;
    final bodyH =
        mediaHeight - appBarH; // Calculating remaining height for body

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Stack(
        children: [
          Column(
            children: [
              // AppBar Section
              Container(
                color: const Color(0xff313131),
                height: appBarH,
                width: mediaWidth,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      const Row(
                        children: [
                          Text(
                            "Location",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffA2A2A2),
                            ),
                          ),
                          Spacer(),
                          CartBage(),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          Text(
                            "Bilzen, Tanjungbalai",
                            style: TextStyle(color: Color(0xffD8D8D8)),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xffD8D8D8),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: const Color(0xff2A2A2A),
                            ),
                            width: mediaWidth * 0.70,
                            height: mediaHeight * 0.1,
                            child: const Row(
                              children: [
                                SizedBox(width: 10),
                                Icon(
                                  Icons.search,
                                  color: Color(0xffFFFFFF),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Search coffee",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xffA2A2A2),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          CustomButton(
                            buttonIcon: const Icon(
                              Icons.filter_list,
                              color: Colors.white,
                            ),
                            buttonText: "",
                            onTap: () {},
                            buttonWidth: mediaWidth * 0.2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Body Section

              Container(
                height: bodyH - 58,
                decoration: BoxDecoration(
                  color: CustomColors().grey1,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: SizedBox(
                        height: 50, // Limit the height of ListView
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: coffeeFlavors.length,
                          itemBuilder: (context, index) {
                            return CoffeeFlavorCard(
                              onTap: () {
                                selectedFlavorIndex =
                                    index; // Update the selected index
                                selectedCategory = coffeeFlavors[
                                    index]; // Set selected category
                                filterItemsByCategory(
                                    selectedCategory); // Filter items
                                setState(() {
                                  log(filteredItems.length.toString());
                                });
                              },
                              flavorName: coffeeFlavors[index],
                              isSelected: selectedFlavorIndex == index,
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 10),
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    filteredItems.length == 0
                        ? Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  "assets/images/nodataJson.json",
                                  height: 200,
                                  width: 200,
                                ),
                                const Text(
                                  "No items found",
                                  style: TextStyle(
                                    color: Color(0xff2A2A2A),
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 35),
                              child: GridView.builder(
                                //TODO : remove scroll of this and use parent single child scroll view
                                // physics: const NeverScrollableScrollPhysics(),
                                // shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: (mediaWidth * 0.4) /
                                            (mediaHeight * 0.30),
                                        crossAxisSpacing: 20,
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 20),
                                itemCount: filteredItems.length,
                                itemBuilder: (context, index) {
                                  return ItemCard(
                                    isFavorite: CoffeeShopItems()
                                        .favoriteItems
                                        .contains(filteredItems[index]),
                                    onFavoriteTap: () {
                                      if (!CoffeeShopItems()
                                          .favoriteItems
                                          .contains(filteredItems[index])) {
                                        setState(() {
                                          CoffeeShopItems().favoriteItems.add(
                                              filteredItems[
                                                  index]); // Add item to the favorites list
                                        });
                                        log("${filteredItems[index].name} added to favorites");
                                      } else {
                                        CoffeeShopItems()
                                            .favoriteItems
                                            .remove(filteredItems[index]);
                                        log("${filteredItems[index].name} is already in favorites");
                                      }
                                      setState(() {});
                                    },
                                    onButtonTap: () {
                                      ShoppingCart().addItem(
                                        filteredItems[index],
                                      );
                                      setState(() {
                                        log(
                                          ShoppingCart()
                                              .orderedItems
                                              .toString(),
                                        );
                                      });
                                    },
                                    onTap: () {
                                      log("");
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return DetailitemView(
                                            coffeeData: filteredItems[index],
                                            isFavourite: CoffeeShopItems()
                                                .favoriteItems
                                                .contains(filteredItems[index]),
                                            // selectedItem: filteredItems[
                                            //     index], // Pass the selected item
                                          );
                                        },
                                      ));
                                    },
                                    coffeeData: filteredItems[index],
                                  );
                                },
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: appBarH -
                70, // Adjusting position to overlap both AppBar and Body
            // left: (mediaWidth / 20), // Center horizontally
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/Banner.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
