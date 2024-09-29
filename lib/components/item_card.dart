import 'package:brewly/components/custom_colors.dart';
import 'package:brewly/domain/coffee_model.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final CoffeeItem coffeeData;
  final bool isFavorite;
  final Function()? onTap;
  final Function()? onButtonTap;
  final Function()? onFavoriteTap; // For handling favorite button tap

  const ItemCard({
    super.key,
    required this.coffeeData,
    this.isFavorite = false,
    this.onTap,
    this.onButtonTap,
    this.onFavoriteTap, // Favorite icon tap callback
  });

  @override
  Widget build(BuildContext context) {
    final mediaH = MediaQuery.of(context).size.height;
    final mediaW = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: CustomColors().slightbrown,
              borderRadius: BorderRadius.circular(16),
            ),
            height: 238,
            width: 156,
            child: Column(
              children: [
                const SizedBox(height: 10),

                // Apply border radius to the image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                  child: Image.asset(
                    coffeeData.img[0], // Use the first image in the list
                    height: 100,
                    width: 110,
                    fit: BoxFit.cover, // Ensures the image covers the container properly
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        textAlign: TextAlign.start,
                        coffeeData.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.start,
                        coffeeData.category,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            textAlign: TextAlign.start,
                            '\$${ coffeeData.price.toStringAsFixed(2)}', // Format price to 2 decimal places
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: onButtonTap,
                            child: Image.asset("assets/images/addbutton.jpg"),
                          ),
                          const SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 5, // Align it to the top-right corner
          child: IconButton(
            onPressed: onFavoriteTap, // Add the favorite button's functionality here
            icon: Icon(
              isFavorite == true ? Icons.favorite :Icons.favorite_border , // Unselected favorite icon
              color: Colors.redAccent,
            ),
          ),
        ),
      ],
    );
  }
}
