class CoffeeItem {
  final String name;
  final String description;
  final List<String> img;  // List of image paths
  final String nutritionalFact;
  final double starRating;
  final List<Review> review;
  final double price;
  final String tagline;
  final String category;
  final List<String> tags;
  int quantity;  // Add quantity field

  CoffeeItem({
    required this.name,
    required this.description,
    required this.img,
    required this.nutritionalFact,
    required this.starRating,
    required this.review,
    required this.price,
    required this.tagline,
    required this.category,
    required this.tags,
    this.quantity = 1,  // Default quantity value is 1
  });

  // Factory method to parse from a Map (JSON-like)
  factory CoffeeItem.fromMap(Map<String, dynamic> map) {
    return CoffeeItem(
      name: map['name'],
      description: map['description'],
      img: List<String>.from(map['img']),  // Ensure images are a List<String>
      nutritionalFact: map['nurtrionalFact'],
      starRating: map['starRating'],
      review: List<Review>.from(map['review'].map((r) => Review.fromMap(r))),
      price: map['price'].toDouble(),  // Ensure it's a double
      tagline: map['tagline'],
      category: map['category'],
      tags: List<String>.from(map['tags']),
      quantity: map['quantity'] ?? 1,  // Default value 1 if not provided
    );
  }

  // Method to convert this object to a Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'img': img,
      'nurtrionalFact': nutritionalFact,
      'starRating': starRating,
      'review': review.map((r) => r.toMap()).toList(),
      'price': price,
      'tagline': tagline,
      'category': category,
      'tags': tags,
      'quantity': quantity,  // Include quantity in the map
    };
  }
}
class Review {
  final String reviewerName;
  final String review;
  final double starRating;

  Review({
    required this.reviewerName,
    required this.review,
    required this.starRating,
  });

  // Factory method to parse from a Map
  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      reviewerName: map['reviewername'],
      review: map['review'],
      starRating: map['starRating'].toDouble(),
    );
  }

  // Method to convert this object to a Map
  Map<String, dynamic> toMap() {
    return {
      'reviewername': reviewerName,
      'review': review,
      'starRating': starRating,
    };
  }
}
