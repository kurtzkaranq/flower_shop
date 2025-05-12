import 'package:flower_shop/logic/bloc/home/home_bloc.dart';
import 'package:flower_shop/logic/clients/firebase_client.dart';
import 'package:flower_shop/logic/mixin/product_mixin.dart';
import 'package:flower_shop/utils/fs_color.dart';
import 'package:flower_shop/utils/fs_textstyle.dart';
import 'package:flower_shop/views/components/fs_bottom_notch.dart';
import 'package:flower_shop/views/components/fs_category.dart';
import 'package:flower_shop/views/components/fs_input.dart';
import 'package:flower_shop/views/components/fs_loading.dart';
import 'package:flower_shop/views/components/fs_product.dart';
import 'package:flower_shop/views/components/fs_title.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with ProductMixin<HomeScreen> {
  final HomeBloc bloc = HomeBloc(firebaseClient: FirebaseClient());

  @override
  void initState() {
    super.initState();
    bloc.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<bool>(
          initialData: true,
          stream: bloc.loadingSubject,
          builder: (context, loadingSnap) {
            return loadingSnap.data!
                ? const FsLoading()
                : SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 60,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 24,
                              ),
                              Image.asset(
                                "assets/icons/logo.png",
                                height: 48,
                              ),
                              Image.asset(
                                "assets/icons/ic_notif.png",
                                height: 24,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          FsTitle(
                            onClick: () {
                              toProductsScreen("");
                            },
                            subtitle: "View all",
                            title: "Special offers",
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                16,
                              ),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(
                              "assets/images/img_sales.png",
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (int i = 0; i < bloc.categories.length; i++)
                                  // Rounded items
                                  GestureDetector(
                                    onTap: () {
                                      toProductsScreen("");
                                    },
                                    child: FsCategory(
                                      categoryModel: bloc.categories[i],
                                    ),
                                  )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          FsTitle(
                            onClick: () {
                              toProductsScreen("trends");
                            },
                            subtitle: "View all",
                            title: "Trends & Popular now",
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (int i = 0; i < bloc.trends.length; i++)
                                  // Rounded items
                                  GestureDetector(
                                    onTap: () {
                                      toProductDetailScreen(bloc.trends[i]);
                                    },
                                    child: FsProduct(
                                      model: bloc.trends[i],
                                    ),
                                  )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          FsTitle(
                            onClick: () {
                              toProductsScreen("halloween");
                            },
                            subtitle: "View all",
                            title: "Halloween theme",
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (int i = 0; i < bloc.halloween.length; i++)
                                  // Rounded items
                                  GestureDetector(
                                    onTap: () {
                                      toProductDetailScreen(bloc.halloween[i]);
                                    },
                                    child: FsProduct(
                                      model: bloc.halloween[i],
                                    ),
                                  )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Upcoming events",
                              style: FsTextstyle.header,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                16,
                              ),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(
                              "assets/images/img_christmas.png",
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const FsBottomNotch(),
                          // Text(
                          //   "aa",
                          // )
                        ],
                      ),
                    ),
                  );
          }),
    );
  }
}
