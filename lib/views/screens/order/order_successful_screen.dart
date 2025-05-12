import 'package:flower_shop/utils/fs_color.dart';
import 'package:flower_shop/utils/fs_textstyle.dart';
import 'package:flower_shop/views/components/fs_bottom_notch.dart';
import 'package:flower_shop/views/components/fs_button.dart';
import 'package:flutter/material.dart';

class OrderSuccessfulScreen extends StatefulWidget {
  const OrderSuccessfulScreen({super.key});

  static const routeName = "OrderSuccessfulScreen";

  @override
  State<OrderSuccessfulScreen> createState() => _OrderSuccessfulScreenState();
}

class _OrderSuccessfulScreenState extends State<OrderSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 64,
              ),
              Center(
                child: Image.asset(
                  "assets/icons/ic_thank_you.png",
                  width: 190,
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              Text(
                "Your order is received  ",
                style: FsTextstyle.header.copyWith(
                  color: FsColor.black,
                ),
              ),
              const Spacer(),
              FsButton(
                  title: "Shop More",
                  onClick: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  }),
              const FsBottomNotch()
            ],
          ),
        ),
      ),
    );
  }
}
