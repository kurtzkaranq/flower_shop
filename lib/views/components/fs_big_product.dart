import 'package:flower_shop/logic/models/index.dart';
import 'package:flower_shop/utils/fs_color.dart';
import 'package:flower_shop/utils/fs_textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FsBigProduct extends StatelessWidget {
  const FsBigProduct(
      {super.key, required this.productModel, required this.onClick});
  final ProductModel productModel;
  final Function(ProductModel model) onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12,
        ),
        border: Border.all(
          color: FsColor.lighterGreen,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            productModel.image,
            fit: BoxFit.contain,
            height: 140,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    "assets/icons/ic_star.png",
                    height: 24,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    productModel.rating,
                    style: FsTextstyle.body.copyWith(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: Image.asset(
                  "assets/icons/ic_heart.png",
                  color: FsColor.darkGreen,
                  height: 24,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            productModel.name,
            style: FsTextstyle.header.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Text(
            "\$${productModel.price.toInt()}",
            style: FsTextstyle.header.copyWith(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          SizedBox(
            height: 30,
            child: CupertinoButton(
              onPressed: () {
                onClick(productModel);
              },
              borderRadius: BorderRadius.circular(12),
              color: FsColor.mainGreen,
              padding: EdgeInsets.zero,
              child: Center(
                child: Text(
                  "See detail",
                  style: FsTextstyle.body,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
