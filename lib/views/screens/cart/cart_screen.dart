import 'package:flower_shop/views/components/fs_app_bar.dart';
import 'package:flower_shop/views/screens/cart/cart_detail.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  static const routeName = "CartScreen";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FsAppbar(),
      body: CartDetail(),
    );
  }
}
