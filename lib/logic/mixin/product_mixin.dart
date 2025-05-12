import 'package:flower_shop/logic/models/index.dart';
import 'package:flower_shop/utils/product_service.dart';
import 'package:flower_shop/views/screens/all_product/all_product_screen.dart';
import 'package:flower_shop/views/screens/cart/cart_screen.dart';
import 'package:flower_shop/views/screens/product/product_screen.dart';
import 'package:flutter/material.dart';

mixin ProductMixin<T extends StatefulWidget> on State<T> {
  void toProductDetailScreen(ProductModel product) {
    ProductService.selectedProduct = product;
    Navigator.pushNamed(context, ProductScreen.routeName);
  }

  void toProductsScreen(String type) {
    ProductService.selectedType = type;
    Navigator.pushNamed(context, AllProductScreen.routeName);
  }

  void addToCart(ProductModel product) {
    ProductService.addToCart(product);
    Navigator.pushNamed(context, CartScreen.routeName);
  }

  void toProductDetailScreenWithPop(ProductModel product) {
    ProductService.selectedProduct = product;
    Navigator.popAndPushNamed(context, ProductScreen.routeName);
  }
}
