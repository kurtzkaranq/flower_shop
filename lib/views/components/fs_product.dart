import 'package:flower_shop/logic/models/index.dart';
import 'package:flower_shop/utils/fs_color.dart';
import 'package:flower_shop/utils/fs_textstyle.dart';
import 'package:flutter/material.dart';

class FsProduct extends StatelessWidget {
  const FsProduct({super.key, required this.model});
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12,
        ),
        border: Border.all(
          width: 1,
          color: FsColor.lighterGreen,
        ),
      ),
      width: 136,
      height: 150,
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              alignment: Alignment.center,
              height: 90,
              child: Image.asset(
                model.image,
              )),
          const SizedBox(
            height: 4,
          ),
          Text(
            model.name,
            style: FsTextstyle.header.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Text(
            "\$${model.price.toInt()}",
            style: FsTextstyle.header.copyWith(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
