class ProductModel {
  final String image;
  final String name;
  final double price;
  int quantity;
  final String rating;
  final String type;

  ProductModel({
    required this.image,
    required this.name,
    required this.price,
    required this.type,
    this.quantity = 1,
    this.rating = "4.89",
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
        image: map['image'] ?? '',
        name: map['name'] ?? '',
        price: (map['price'] as num?)?.toDouble() ?? 0.0,
        rating: map['rating']?.toString() ?? '4.89',
        type: map["type"] ?? "");
  }

  void incrementAmount() {
    quantity += 1;
  }

  void decrementAmount() {
    if (quantity > 0) {
      quantity -= 1;
    }
  }

  double get totalPrice => quantity * price;
}
