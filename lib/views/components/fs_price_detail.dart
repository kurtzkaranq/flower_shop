import 'package:flower_shop/logic/models/index.dart';
import 'package:flower_shop/utils/fs_color.dart';
import 'package:flower_shop/utils/fs_textstyle.dart';
import 'package:flutter/material.dart';

class FsPriceDetail extends StatelessWidget {
  const FsPriceDetail(
      {super.key, required this.items, required this.totalAmount});
  final List<ProductModel> items;
  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 0; i < items.length; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${items[i].name}   x${items[i].quantity}",
                      ),
                      Text("${(items[i].quantity * items[i].price).toInt()}\$")
                    ],
                  )
              ],
            ),
          ),
        ),
        const Divider(
          color: FsColor.lighterGreen,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Subtotal ",
              style: FsTextstyle.body.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "$totalAmount\$",
              style: FsTextstyle.body.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Delivery ",
              style: FsTextstyle.body.copyWith(
                color: Colors.black,
              ),
            ),
            Text(
              "free",
              style: FsTextstyle.body.copyWith(
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total ",
              style: FsTextstyle.body.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            Text(
              "${totalAmount}\$",
              style: FsTextstyle.body.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
