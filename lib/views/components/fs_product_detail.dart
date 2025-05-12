import 'package:flower_shop/logic/models/index.dart';
import 'package:flower_shop/utils/fs_color.dart';
import 'package:flower_shop/utils/fs_textstyle.dart';
import 'package:flower_shop/utils/product_service.dart';
import 'package:flower_shop/views/components/fs_button.dart';
import 'package:flower_shop/views/components/fs_change_quantity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FsProductDetail extends StatelessWidget {
  const FsProductDetail(
      {super.key,
      required this.productModel,
      required this.toNewScreen,
      required this.addToCart});
  final ProductModel productModel;
  final Function(ProductModel model) toNewScreen;
  final Function(ProductModel model) addToCart;
  int get getLength {
    if (ProductService.allProductsDistinctByName.length < 4) {
      return ProductService.allProductsDistinctByName.length;
    }
    return 4;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        16,
      ),
      child: Column(
        children: [
          Image.asset(
            productModel.image,
            height: 270,
            width: double.infinity,
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 452,
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.white,
              border: Border.all(
                color: FsColor.lighterGreen,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.name,
                  style: FsTextstyle.header,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    for (int i = 0; i < 5; i++)
                      Image.asset(
                        "assets/icons/ic_star.png",
                        height: 16,
                      ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "${productModel.rating} (41 reviews)",
                      style: FsTextstyle.body.copyWith(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Composition :",
                      style: FsTextstyle.secondary.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      "5 white flowers, 1 blue flower ",
                      style: FsTextstyle.body.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: 250,
                  child: FsChangeQuantity(
                    productModel: productModel,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "\$${productModel.price.toInt()}",
                  style: FsTextstyle.header,
                ),
                const SizedBox(
                  height: 24,
                ),
                FsButton(
                  title: "Add to cart",
                  onClick: () {
                    addToCart(productModel);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                const Divider(
                  color: FsColor.lighterGreen,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (int i = 0; i < getLength; i++)
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            toNewScreen(
                              ProductService.allProductsDistinctByName[i],
                            );
                          },
                          child: Container(
                            width: 56,
                            height: 56,
                            color: FsColor.grey,
                            child: Image.asset(
                              ProductService.allProductsDistinctByName[i].image,
                              height: 40,
                            ),
                          ),
                        )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
