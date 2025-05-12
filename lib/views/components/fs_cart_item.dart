import 'package:flower_shop/logic/models/index.dart';
import 'package:flower_shop/utils/fs_color.dart';
import 'package:flower_shop/utils/fs_textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FsCartItem extends StatefulWidget {
  const FsCartItem(
      {super.key, required this.item, required this.removeFromCart});
  final ProductModel item;
  final Function() removeFromCart;
  @override
  State<FsCartItem> createState() => _FsCartItemState();
}

class _FsCartItemState extends State<FsCartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 152,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: FsColor.lighterGreen,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(widget.item.image),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.name,
                    style: FsTextstyle.header.copyWith(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Available in stock",
                    style: FsTextstyle.secondary,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Quantity : ${widget.item.quantity}",
                    style: FsTextstyle.body.copyWith(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              const Spacer(),
              Align(
                alignment: Alignment.topRight,
                child: CupertinoButton(
                  onPressed: () {
                    setState(() {
                      widget.removeFromCart();
                    });
                  },
                  child: Image.asset(
                    "assets/icons/ic_bin.png",
                    height: 16,
                  ),
                ),
              )
            ],
          ),
          const Divider(
            color: FsColor.lighterGreen,
          )
        ],
      ),
    );
  }
}
