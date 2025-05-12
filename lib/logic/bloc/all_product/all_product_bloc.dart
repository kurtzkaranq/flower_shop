import 'package:flower_shop/logic/models/index.dart';
import 'package:flower_shop/utils/product_service.dart';

class AllProductBloc {
  void addToCart(ProductModel product) {}

  void onClick(ProductModel product) {
    ProductService.selectedProduct = product;
  }
}
