import 'dart:developer';

import 'package:brewly/components/item_card.dart';
import 'package:brewly/data/data.dart';
import 'package:brewly/data/temp_data.dart';
import 'package:brewly/functions/shopping_cart.dart';
import 'package:brewly/screens/detailItem_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FavView extends StatefulWidget {
  const FavView({super.key});

  @override
  State<FavView> createState() => _FavViewState();
}

class _FavViewState extends State<FavView> {

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        // leading: InkWell(
        //
        //   child: const Icon(Icons.arrow_back_ios_new),
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        // ),
        centerTitle: true,
        title: const Text("Favourite"),
      ),
      body: CoffeeShopItems().favoriteItems.length == 0 ?Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Lottie.asset('assets/images/nofavjson.json', height: mediaHeight - 400, width: mediaWidth -100),
            Text(
              "No Favourite Found",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ) : Padding(


        padding: const EdgeInsets.symmetric(horizontal: 45),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: (mediaWidth * 0.4) / (mediaHeight * 0.30),
              crossAxisSpacing: 20,
              crossAxisCount: 2,
              mainAxisSpacing: 20),
          itemCount: CoffeeShopItems().favoriteItems.length,
          itemBuilder: (context, index) {
            return ItemCard(
              isFavorite: CoffeeShopItems()
                  .favoriteItems
                  .contains(CoffeeShopItems().favoriteItems[index]),
              onFavoriteTap: () {

                  CoffeeShopItems().favoriteItems.remove(CoffeeShopItems().favoriteItems[index]);

                setState(() {});
              },
              onButtonTap: () {
                ShoppingCart().addItem(
                  CoffeeShopItems().favoriteItems[index],
                );
                setState(() {
                  log(
                    ShoppingCart().orderedItems.toString(),
                  );
                });
              },
              onTap: () {
                log("");
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return DetailitemView(
                      coffeeData: CoffeeShopItems().favoriteItems[index],
                      isFavourite: CoffeeShopItems()
                          .favoriteItems
                          .contains(CoffeeShopItems().favoriteItems[index]),
                      // selectedItem: CoffeeShopItems().favoriteItems[index], // Pass the selected item
                    );
                  },
                ));
              },
              coffeeData: CoffeeShopItems().favoriteItems[index],
            );
          },
        ),
      ),
    );
  }
}
