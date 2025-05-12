import 'dart:async';

import 'package:flower_shop/logic/bloc/cart/cart_detail_bloc.dart';
import 'package:flower_shop/utils/fs_color.dart';
import 'package:flower_shop/utils/fs_textstyle.dart';
import 'package:flower_shop/views/components/fs_app_bar.dart';
import 'package:flower_shop/views/components/fs_bottom_notch.dart';
import 'package:flower_shop/views/components/fs_button.dart';
import 'package:flower_shop/views/components/fs_cart_item.dart';
import 'package:flower_shop/views/components/fs_price_detail.dart';
import 'package:flower_shop/views/screens/order/order_successful_screen.dart';
import 'package:flutter/material.dart';

class OrderConfirmationScreen extends StatefulWidget {
  const OrderConfirmationScreen({super.key});
  static const routeName = "OrderConfirmationScreen";
  @override
  State<OrderConfirmationScreen> createState() =>
      _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  late final StreamSubscription successListener;
  final CartDetailBloc bloc = CartDetailBloc();

  @override
  void initState() {
    super.initState();
    successListener = bloc.successSubject.listen((value) {
      Navigator.pushNamed(context, OrderSuccessfulScreen.routeName);
    });
  }

  @override
  void dispose() {
    successListener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FsAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " Check and confirm your order",
                style: FsTextstyle.secondary.copyWith(
                    color: FsColor.darkGreen,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FsColor.white,
                  border: Border.all(
                    color: FsColor.lighterGreen,
                  ),
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shipping address",
                      style: FsTextstyle.secondary.copyWith(
                        color: FsColor.darkGreen,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: FsColor.grey,
                        ),
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                      ),
                      child: Text(
                          bloc.client.orderModel.deliveryInformation.detail),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Image.asset(
                "assets/icons/ic_divider.png",
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Your order:",
                style: FsTextstyle.secondary.copyWith(
                  color: FsColor.darkGreen,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < bloc.getCartProducts.length; i++)
                        FsCartItem(
                          item: bloc.getCartProducts[i],
                          removeFromCart: () {
                            bloc.removeFromCart(i);
                          },
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FsPriceDetail(
                  items: bloc.getCartProducts,
                  totalAmount: bloc.totalAmount.toDouble(),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              FsButton(
                  title: "Confirm order",
                  onClick: () {
                    bloc.order();
                  }),
              const FsBottomNotch()
            ],
          ),
        ),
      ),
    );
  }
}
