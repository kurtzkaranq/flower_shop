import 'package:flower_shop/logic/clients/order_client.dart';
import 'package:flower_shop/utils/product_service.dart';
import 'package:rxdart/rxdart.dart';

class OrderHistoryBloc {
  final OrderClient client;
  final loadingSubject = PublishSubject<bool>();
  OrderHistoryBloc({required this.client});
  Future<void> getOrders() async {
    loadingSubject.add(true);
    ProductService.orderHistory = await client.getOrders();
    loadingSubject.add(false);
  }
}
