import 'package:flower_shop/logic/models/index.dart';
import 'package:flower_shop/utils/product_service.dart';

class HomeBloc {
  List<CategoryModel> categories = ProductService.categories;
  List<ProductModel> trends = ProductService.trends;
  List<ProductModel> halloween = ProductService.halloween;
}
