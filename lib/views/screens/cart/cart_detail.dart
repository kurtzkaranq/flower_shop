import 'package:flower_shop/logic/bloc/cart/cart_detail_bloc.dart';
import 'package:flower_shop/logic/mixin/product_mixin.dart';
import 'package:flower_shop/utils/fs_color.dart';
import 'package:flower_shop/utils/fs_textstyle.dart';
import 'package:flower_shop/views/components/fs_bottom_notch.dart';
import 'package:flower_shop/views/components/fs_button.dart';
import 'package:flower_shop/views/screens/all_product/all_product_screen.dart';
import 'package:flower_shop/views/screens/order/order_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartDetail extends StatefulWidget {
  const CartDetail({super.key});

  @override
  State<CartDetail> createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> with ProductMixin {
  final CartDetailBloc bloc = CartDetailBloc();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: bloc.getCartProducts.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Center(
                    child: Text(
                      "Cart is empty",
                      style: FsTextstyle.header,
                    ),
                  ),
                  FsButton(
                    title: "Shop more",
                    onClick: () {
                      Navigator.pushNamed(
                        context,
                        AllProductScreen.routeName,
                      );
                    },
                  )
                ],
              )
            : Column(
                children: [
                  SizedBox(
                    height: 355,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (int i = 0; i < bloc.getCartProducts.length; i++)
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
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
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                bloc.getCartProducts[i].image),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            bloc.getCartProducts[i].name,
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
                                            "Quantity : ${bloc.getCartProducts[i].quantity}",
                                            style: FsTextstyle.body.copyWith(
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                      const Spacer(),
                                      CupertinoButton(
                                        onPressed: () {
                                          setState(() {
                                            bloc.removeFromCart(i);
                                          });
                                        },
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Image.asset(
                                            "assets/icons/ic_bin.png",
                                            height: 24,
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
                            ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 340,
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
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Price detail",
                          style: FsTextstyle.header,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          height: 64,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                for (int i = 0;
                                    i < bloc.getCartProducts.length;
                                    i++)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${bloc.getCartProducts[i].name}   x${bloc.getCartProducts[i].quantity}",
                                      ),
                                      Text(
                                          "${(bloc.getCartProducts[i].quantity * bloc.getCartProducts[i].price).toInt()}\$")
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
                              "${bloc.totalAmount}\$",
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
                              "${bloc.totalAmount}\$",
                              style: FsTextstyle.body.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        FsButton(
                            title: "Checkout",
                            onClick: () {
                              Navigator.pushNamed(
                                  context, OrderScreen.routeName);
                            }),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
