import 'package:flower_shop/logic/models/category_model.dart';
import 'package:flower_shop/utils/fs_color.dart';
import 'package:flower_shop/utils/fs_textstyle.dart';
import 'package:flutter/material.dart';

class FsCategory extends StatelessWidget {
  const FsCategory({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            padding: const EdgeInsets.all(
              8,
            ),
            decoration: BoxDecoration(
              color: FsColor.grey,
              borderRadius: BorderRadius.circular(
                100,
              ),
            ),
            child: Image.asset(
              categoryModel.path,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            categoryModel.name,
            style: FsTextstyle.body.copyWith(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
