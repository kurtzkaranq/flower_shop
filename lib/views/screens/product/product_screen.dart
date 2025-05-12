import 'package:flower_shop/logic/mixin/product_mixin.dart';
import 'package:flower_shop/logic/models/index.dart';
import 'package:flower_shop/utils/product_service.dart';
import 'package:flower_shop/views/components/fs_app_bar.dart';
import 'package:flower_shop/views/components/fs_product_detail.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});
  static const routeName = "ProductScreen";

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> with ProductMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FsAppbar(),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          FsProductDetail(
            productModel: ProductService.getSelectedProduct,
            toNewScreen: toProductDetailScreenWithPop,
            addToCart: addToCart,
          ),
        ]),
      ),
    );
  }
}
