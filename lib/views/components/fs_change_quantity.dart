import 'package:flower_shop/logic/models/index.dart';
import 'package:flower_shop/utils/fs_textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FsChangeQuantity extends StatefulWidget {
  const FsChangeQuantity({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  State<FsChangeQuantity> createState() => _FsChangeQuantityState();
}

class _FsChangeQuantityState extends State<FsChangeQuantity> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            setState(() {
              widget.productModel.decrementAmount();
            });
          },
          child: Image.asset(
            "assets/icons/ic_decrement.png",
            height: 24,
          ),
        ),
        Text(
          widget.productModel.quantity.toString(),
          style: FsTextstyle.body.copyWith(color: Colors.black),
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            setState(() {
              widget.productModel.incrementAmount();
            });
          },
          child: Image.asset(
            "assets/icons/ic_increment.png",
            height: 24,
          ),
        ),
      ],
    );
  }
}
