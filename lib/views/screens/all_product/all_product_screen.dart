import 'package:flower_shop/logic/bloc/all_product/all_product_bloc.dart';
import 'package:flower_shop/logic/mixin/product_mixin.dart';
import 'package:flower_shop/logic/models/index.dart';
import 'package:flower_shop/utils/product_service.dart';
import 'package:flower_shop/views/components/fs_app_bar.dart';
import 'package:flower_shop/views/components/fs_big_product.dart';
import 'package:flutter/material.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});
  static const routeName = "AllProductScreen";
  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> with ProductMixin {
  final AllProductBloc bloc = AllProductBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FsAppbar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: ProductService.getItemsByType.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1 / 1.62,
                crossAxisSpacing: 8,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                ProductModel productModel =
                    ProductService.getItemsByType[index];
                return GestureDetector(
                  onTap: () {
                    toProductDetailScreen(productModel);
                  },
                  child: FsBigProduct(
                    productModel: productModel,
                    onClick: toProductDetailScreen,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
