class ProductModel {
  final String image;
  final String name;
  final double price;
  int quantity;
  final String rating;

  ProductModel({
    required this.image,
    required this.name,
    required this.price,
    this.quantity = 1,
    this.rating = "4.89",
  });

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
