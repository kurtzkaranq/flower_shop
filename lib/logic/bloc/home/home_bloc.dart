import 'package:flower_shop/logic/clients/firebase_client.dart';
import 'package:flower_shop/logic/models/index.dart';
import 'package:flower_shop/utils/product_service.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  HomeBloc({required this.firebaseClient});
  final FirebaseClient firebaseClient;
  List<CategoryModel> get categories => ProductService.categories;
  List<ProductModel> get trends => ProductService.trends;
  List<ProductModel> get halloween => ProductService.halloween;
  final loadingSubject = PublishSubject<bool>();
  List aa = [];
  Future<void> init() async {
    await getAllProducts();
    await getAllCategoriesWithProducts();
  }

  Future<void> getAllProducts() async {
    loadingSubject.add(true);
    ProductService.allProducts = await firebaseClient.getAllProducts();
    loadingSubject.add(false);
  }

  Future<void> getAllCategoriesWithProducts() async {
    loadingSubject.add(true);
    ProductService.categories =
        await firebaseClient.getAllCategoriesWithProducts();
    loadingSubject.add(false);
  }
}
