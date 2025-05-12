import 'package:flower_shop/logic/bloc/order/order_history_bloc.dart';
import 'package:flower_shop/logic/clients/order_client.dart';
import 'package:flower_shop/utils/fs_color.dart';
import 'package:flower_shop/utils/fs_textstyle.dart';
import 'package:flower_shop/utils/product_service.dart';
import 'package:flower_shop/views/components/fs_app_bar.dart';
import 'package:flower_shop/views/components/fs_button.dart';
import 'package:flower_shop/views/components/fs_cart_item.dart';
import 'package:flower_shop/views/components/fs_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});
  static const routeName = "OrderHistoryScreen";
  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  final OrderHistoryBloc bloc = OrderHistoryBloc(client: OrderClient());
  @override
  void initState() {
    super.initState();
    bloc.getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FsAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(
            16,
          ),
          child: StreamBuilder<bool>(
              initialData: true,
              stream: bloc.loadingSubject,
              builder: (context, loadingSnap) {
                return loadingSnap.data!
                    ? FsLoading()
                    : SafeArea(
                        child: Column(
                          children: [
                            for (int i = 0;
                                i < ProductService.orderHistory.length;
                                i++)
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                height: 168,
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
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
                                              image: AssetImage(ProductService
                                                  .orderHistory[i]
                                                  .products
                                                  .first
                                                  .image),
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
                                              ProductService.orderHistory[i]
                                                  .products.first.name,
                                              style:
                                                  FsTextstyle.header.copyWith(
                                                color: Colors.black,
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            Text(
                                              "Order Number:  #2482011 ",
                                              style: FsTextstyle.secondary,
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              width: 128,
                                              child: CupertinoButton(
                                                onPressed: () {},
                                                borderRadius:
                                                    BorderRadius.circular(12),
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
                                      ],
                                    ),
                                  ],
                                ),
                              )
                          ],
                        ),
                      );
              }),
        ),
      ),
    );
  }
}
