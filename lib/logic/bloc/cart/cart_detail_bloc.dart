import 'package:flower_shop/logic/clients/order_client.dart';
import 'package:flower_shop/logic/models/index.dart';
import 'package:flower_shop/utils/product_service.dart';
import 'package:rxdart/rxdart.dart';

class CartDetailBloc {
  final OrderClient client = OrderClient();
  final loadingSubject = PublishSubject<bool>();
  final successSubject = PublishSubject<bool>();
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

  Future<void> order() async {
    loadingSubject.add(true);
    await client.createOrderForUser(
      username: "testuser",
      products: getCartProducts,
    );
    loadingSubject.add(false);
    successSubject.add(true);
  }
}
