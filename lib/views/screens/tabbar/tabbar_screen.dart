import 'package:flower_shop/logic/bloc/tabbar/tabbar_bloc.dart';
import 'package:flower_shop/views/components/fs_bottom_bar.dart';
import 'package:flower_shop/views/screens/cart/cart_detail.dart';
import 'package:flower_shop/views/screens/cart/cart_screen.dart';
import 'package:flower_shop/views/screens/favorite/favorite_screen.dart';
import 'package:flower_shop/views/screens/home/home_screen.dart';
import 'package:flower_shop/views/screens/profile/profile_screen.dart';
import 'package:flower_shop/views/screens/shop/shop_screen.dart';
import 'package:flutter/material.dart';

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({super.key});
  static const routeName = "TabbarScreen";

  @override
  State<TabbarScreen> createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> {
  final TabbarBloc bloc = TabbarBloc();
  List<Widget> controller = [];
  @override
  void initState() {
    super.initState();
    bloc.selectedIndex.add(0);
    controller = [
      HomeScreen(),
      CartDetail(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        initialData: 0,
        stream: bloc.selectedIndex.stream,
        builder: (context, tabSnap) {
          return PopScope(
            canPop: false,
            child: Scaffold(
              extendBody: true,
              body: Container(
                child: controller[tabSnap.data!],
              ),
              bottomNavigationBar: ClipRRect(
                clipBehavior: Clip.hardEdge,
                child: FsBottomBar(
                  selectedIndex: tabSnap.data!,
                  onClick: bloc.selectedIndex.add,
                  items: bloc.icons,
                ),
              ),
            ),
          );
        });
  }
}
