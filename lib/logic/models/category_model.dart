import 'package:flower_shop/logic/models/index.dart';

class CategoryModel {
  final String name;
  final String path;
  List<ProductModel> products;

  CategoryModel({
    required this.name,
    required this.path,
    this.products = const [],
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'] ?? '',
      path: map['path'] ?? '',
      // products will be filled separately
    );
  }
}
