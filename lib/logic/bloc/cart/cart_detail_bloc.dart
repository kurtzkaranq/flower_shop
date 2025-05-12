import 'package:flower_shop/logic/models/index.dart';
import 'package:flower_shop/utils/product_service.dart';

class CartDetailBloc {
  List<ProductModel> get getCartProducts {
    return ProductService.getCart;
  }

  void removeFromCart(int index) {
    ProductService.removeFromCart(index);
  }

  int get totalAmount {
    return getCartProducts
        .fold(0.0, (sum, item) => sum + item.totalPrice)
        .toInt();
  }
}
