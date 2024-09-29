import 'package:brewly/components/images_path.dart';
import 'package:brewly/domain/coffee_model.dart';
import 'package:brewly/functions/shopping_cart.dart';
import 'package:flutter/material.dart';

class CoffeeShopItems with ChangeNotifier {
  // Make the class a Singleton
  static final CoffeeShopItems _instance = CoffeeShopItems._internal();
  factory CoffeeShopItems() => _instance;

  CoffeeShopItems._internal(); // Private constructor

  final List<String> coffeeFlavors = [
    'All Coffee',
    'Espresso',
    'Cappuccino',
    'Latte',
    'Americano',
    'Mocha',
    'Macchiato',
    'Affogato',
    'Cortado',
    'Flat White',
    'Irish Coffee'
  ];

  final List<String> sizes = ["S", "M", "L"];
  final List<String> dOptions = ['Deliver', 'Pick Up'];
  List<CoffeeItem> favoriteItems = [];

  // List<Map<String, dynamic>> orderedItems = [];
  final Map<String, dynamic> selectedItem = {}; // Expect the whole item

//   void addItem(Map<String, dynamic> item) {
//     int index = orderedItems.indexWhere(
//       (element) => element['name'] == item['name'],
//     );

//     if (index > 0) {
//       // item already in cart, increase quantity
//       orderedItems[index]['quantity']++;
//       orderedItems[index]['totalPrice'] =
//           orderedItems[index]['quantity'] * orderedItems[index]['price'];
//     } else {
//       //item does not in cart, add it with quantity 1
//       orderedItems.add(
//         {
//           'name': item['name'],
//           'price': item['price'],
//           'quantity': 1,
//           'totalPrice': item['price'],
//         },
//       );
//     }
//     notifyListeners();
//   }

//   // Function to decrease the quantity of an item
//   void lessItem(Map<String, dynamic> item) {
//     int index =
//         orderedItems.indexWhere((element) => element['name'] == item['name']);

//     if (index >= 0) {
//       if (orderedItems[index]['quantity'] > 1) {
//         // Decrease the quantity and update total price
//         orderedItems[index]['quantity']--;
//         orderedItems[index]['totalPrice'] =
//             orderedItems[index]['quantity'] * orderedItems[index]['price'];
//       } else {
//         // If quantity is 1, remove the item from the cart
//         orderedItems.removeAt(index);
//       }

//       notifyListeners();
//     }
//   }

// // Get the total price of items in the cart
//   double get totalCartPrice {
//     return orderedItems.fold(0, (sum, item) => sum + item['totalPrice']);
//   }


  List<CoffeeItem> itemList = [
    CoffeeItem(
      name: 'Flat White',
      description:
      'A balanced coffee drink made with equal parts espresso, steamed milk, and topped with a frothy milk foam. Great for coffee lovers who enjoy a creamy touch.',
      img: [
        AppImagesPath().secondImage,
        AppImagesPath().firstImage,
      ],
      nutritionalFact:
      'Cappuccino provides around 80 calories with moderate caffeine content and is a good source of calcium when made with milk.',
      starRating: 4.5,
      review: [
        Review(
          reviewerName: 'Sophia',
          review: 'Perfect balance of coffee and milk',
          starRating: 4.5,
        ),
        Review(
          reviewerName: 'Mark',
          review: 'Good, but a bit too milky for me',
          starRating: 4,
        ),
      ],
      price: 3.53,
      tagline: 'Smooth & Creamy',
      category: 'Espresso',
      tags: ['Creamy', 'Smooth', 'Popular'],
      quantity: 1,  // Default quantity value
    ),
    CoffeeItem(
      name: 'Caffe Mocha',
      description:
      'A strong, rich coffee brewed by forcing hot water through finely-ground coffee beans. Perfect for coffee purists who love a bold flavor.',
      img: [
        AppImagesPath().firstImage,
        AppImagesPath().firstImage,
      ],
      nutritionalFact:
      'Espresso contains around 63 mg of caffeine per shot, along with essential antioxidants. Low in calories if consumed without sugar or milk.',
      starRating: 4.8,
      review: [
        Review(
          reviewerName: 'John',
          review: 'Strong and aromatic!',
          starRating: 5,
        ),
        Review(
          reviewerName: 'Anna',
          review: 'Too strong for my taste',
          starRating: 3.5,
        ),
      ],
      price: 4.53,
      tagline: 'Pure Coffee Bliss',
      category: 'Cappuccino',
      tags: ['Deep Foam', 'Classic', 'Popular'],
      quantity: 1,
    ),
    CoffeeItem(
      name: 'Latte',
      description:
      'A smooth coffee made with espresso and steamed milk, topped with a thin layer of foam. Ideal for those who enjoy a subtle coffee flavor.',
      img: [
        AppImagesPath().thirdImage,
        AppImagesPath().firstImage,
      ],
      nutritionalFact:
      'Latte contains around 150 calories with a moderate amount of caffeine. A rich source of calcium from the milk.',
      starRating: 4.7,
      review: [
        Review(
          reviewerName: 'Emma',
          review: 'Love the silky texture!',
          starRating: 5,
        ),
        Review(
          reviewerName: 'Liam',
          review: 'A bit too sweet for me',
          starRating: 4,
        ),
      ],
      price: 5.2,
      tagline: 'Velvety Delight',
      category: 'Espresso',
      tags: ['Smooth', 'Popular', 'Mild'],
      quantity: 1,
    ),
    CoffeeItem(
      name: 'Americano',
      description:
      'A refreshing cold coffee made by diluting espresso with cold water. It’s a light, energizing option perfect for summer.',
      img: [
        AppImagesPath().fourthImage,
        AppImagesPath().firstImage,
      ],
      nutritionalFact:
      'Iced Americano has zero calories if consumed without added sugar or cream. Provides a refreshing caffeine kick with no fat.',
      starRating: 4.2,
      review: [
        Review(
          reviewerName: 'David',
          review: 'Refreshing and light!',
          starRating: 4.5,
        ),
        Review(
          reviewerName: 'Lucas',
          review: 'A bit too watery',
          starRating: 3.5,
        ),
      ],
      price: 4.2,
      tagline: 'Cool & Refreshing',
      category: 'Cappuccino',
      tags: ['Iced', 'Low Calorie', 'Popular'],
      quantity: 1,
    ),
    CoffeeItem(
      name: 'Mocha',
      description:
      'A rich blend of espresso, steamed milk, and chocolate syrup. Perfect for those who love the fusion of coffee and chocolate.',
      img: [
        AppImagesPath().fifthImage,
        AppImagesPath().firstImage,
      ],
      nutritionalFact:
      'Mocha contains about 250 calories due to the chocolate and milk content, offering a treat with both caffeine and sugar.',
      starRating: 4.6,
      review: [
        Review(
          reviewerName: 'Rachel',
          review: 'Chocolatey goodness!',
          starRating: 5,
        ),
        Review(
          reviewerName: 'Jake',
          review: 'A bit too sweet',
          starRating: 4,
        ),
      ],
      price: 4,
      tagline: 'Chocolate Indulgence',
      category: 'Cappuccino',
      tags: ['Rich', 'Sweet', 'Popular'],
      quantity: 1,
    ),
  ];


// TODO : Old Data Without CoffeeModel
  // List itemList = [
  //   {
  //     'name': 'Flat White',
  //     'description':
  //         'A balanced coffee drink made with equal parts espresso, steamed milk, and topped with a frothy milk foam. Great for coffee lovers who enjoy a creamy touch.',
  //     'img': [
  //       AppImagesPath().secondImage,
  //       AppImagesPath().firstImage,
  //     ],
  //     'nurtrionalFact':
  //         'Cappuccino provides around 80 calories with moderate caffeine content and is a good source of calcium when made with milk.',
  //     'starRating': 4.5,
  //     'review': [
  //       {
  //         'reviewername': 'Sophia',
  //         'review': 'Perfect balance of coffee and milk',
  //         'starRating': 4.5
  //       },
  //       {
  //         'reviewername': 'Mark',
  //         'review': 'Good, but a bit too milky for me',
  //         'starRating': 4
  //       },
  //     ],
  //     'price': 3.53,
  //     'tagline': 'Smooth & Creamy',
  //     'category': 'Espresso',
  //     'tags': ['Creamy', 'Smooth', 'Popular']
  //   },
  //   {
  //     'name': 'Caffe Mocha',
  //     'description':
  //         'A strong, rich coffee brewed by forcing hot water through finely-ground coffee beans. Perfect for coffee purists who love a bold flavor.',
  //     'img': [
  //       AppImagesPath().firstImage,
  //       AppImagesPath().firstImage,
  //     ],
  //     'nurtrionalFact':
  //         'Espresso contains around 63 mg of caffeine per shot, along with essential antioxidants. Low in calories if consumed without sugar or milk.',
  //     'starRating': 4.8,
  //     'review': [
  //       {
  //         'reviewername': 'John',
  //         'review': 'Strong and aromatic!',
  //         'starRating': 5
  //       },
  //       {
  //         'reviewername': 'Anna',
  //         'review': 'Too strong for my taste',
  //         'starRating': 3.5
  //       },
  //     ],
  //     'price': 4.53,
  //     'tagline': 'Pure Coffee Bliss',
  //     'category': 'Cappuccino',
  //     'tags': ['Deep Foam', 'Classic', 'Popular']
  //   },
  //   {
  //     'name': 'Latte',
  //     'description':
  //         'A smooth coffee made with espresso and steamed milk, topped with a thin layer of foam. Ideal for those who enjoy a subtle coffee flavor.',
  //     'img': [
  //       AppImagesPath().thirdImage,
  //       AppImagesPath().firstImage,
  //     ],
  //     'nurtrionalFact':
  //         'Latte contains around 150 calories with a moderate amount of caffeine. A rich source of calcium from the milk.',
  //     'starRating': 4.7,
  //     'review': [
  //       {
  //         'reviewername': 'Emma',
  //         'review': 'Love the silky texture!',
  //         'starRating': 5
  //       },
  //       {
  //         'reviewername': 'Liam',
  //         'review': 'A bit too sweet for me',
  //         'starRating': 4
  //       },
  //     ],
  //     'price': 5.2,
  //     'tagline': 'Velvety Delight',
  //     'category': 'espresso',
  //     'tags': ['Smooth', 'Popular', 'Mild']
  //   },
  //   {
  //     'name': 'Americano',
  //     'description':
  //         'A refreshing cold coffee made by diluting espresso with cold water. It’s a light, energizing option perfect for summer.',
  //     'img': [
  //       AppImagesPath().fourthImage,
  //       AppImagesPath().firstImage,
  //     ],
  //     'nurtrionalFact':
  //         'Iced Americano has zero calories if consumed without added sugar or cream. Provides a refreshing caffeine kick with no fat.',
  //     'starRating': 4.2,
  //     'review': [
  //       {
  //         'reviewername': 'David',
  //         'review': 'Refreshing and light!',
  //         'starRating': 4.5
  //       },
  //       {
  //         'reviewername': 'Lucas',
  //         'review': 'A bit too watery',
  //         'starRating': 3.5
  //       },
  //     ],
  //     'price': 4.2,
  //     'tagline': 'Cool & Refreshing',
  //     'category': 'Cappuccino',
  //     'tags': ['Iced', 'Low Calorie', 'Popular']
  //   },
  //   {
  //     'name': 'Mocha',
  //     'description':
  //         'A rich blend of espresso, steamed milk, and chocolate syrup. Perfect for those who love the fusion of coffee and chocolate.',
  //     'img': [
  //       AppImagesPath().fifthImage,
  //       AppImagesPath().firstImage,
  //     ],
  //     'nurtrionalFact':
  //         'Mocha contains about 250 calories due to the chocolate and milk content, offering a treat with both caffeine and sugar.',
  //     'starRating': 4.6,
  //     'review': [
  //       {
  //         'reviewername': 'Rachel',
  //         'review': 'Chocolatey goodness!',
  //         'starRating': 5
  //       },
  //       {'reviewername': 'Jake', 'review': 'A bit too sweet', 'starRating': 4},
  //     ],
  //     'price': 4,
  //     'tagline': 'Chocolate Indulgence',
  //     'category': 'Cappuccino',
  //     'tags': ['Rich', 'Sweet', 'Popular']
  //   },
  // ];
}
