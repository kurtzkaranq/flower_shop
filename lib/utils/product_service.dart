import 'package:flower_shop/logic/models/index.dart';

class ProductService {
  static final ProductService _singleton = ProductService._internal();
  factory ProductService() {
    return _singleton;
  }
  ProductService._internal();
  static String selectedType = '';
  static List<ProductModel> get getItemsByType {
    switch (selectedType.toLowerCase()) {
      case "trends":
        return trends;
      case "halloween":
        return halloween;
      default:
        return allProductsDistinctByName;
    }
  }

  static ProductModel? selectedProduct;
  static ProductModel get getSelectedProduct => selectedProduct!;

  static List<CategoryModel> categories = [];
  static List<ProductModel> get trends => allProducts.where((e) {
        return e.type == "trends";
      }).toList();
  static List<ProductModel> get halloween => allProducts.where((e) {
        return e.type == "halloween";
      }).toList();

  static List<ProductModel> allProducts = [];
  static List<OrderModel> orderHistory = [];

  static List<ProductModel> get allProductsDistinctByName {
    final seenNames = <String>{};
    return allProducts.where((product) {
      final isNew = seenNames.add(product.name);
      return isNew;
    }).toList();
  }

  static List<ProductModel> favorites = [];

  static final List<ProductModel> _cart = [];

  static void addToCart(ProductModel model) {
    _cart.add(model);
  }

  static void removeFromCart(int index) {
    _cart.removeAt(index);
  }

  static List<ProductModel> get getCart {
    return _cart;
  }
}
