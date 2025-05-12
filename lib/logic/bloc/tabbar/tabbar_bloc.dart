import 'package:rxdart/rxdart.dart';

class TabbarBloc {
  final selectedIndex = PublishSubject<int>();
  List<TabbarModel> get icons {
    return [
      TabbarModel(
        name: "Home",
        path: "assets/icons/ic_home.png",
      ),
      TabbarModel(
        name: "Favorites",
        path: "assets/icons/ic_heart.png",
      ),
      TabbarModel(
        name: "Cart",
        path: "assets/icons/ic_shop.png",
      ),
      TabbarModel(
        name: "Account",
        path: "assets/icons/ic_account.png",
      ),
    ];
  }
}

class TabbarModel {
  final String name;
  final String path;

  TabbarModel({required this.name, required this.path});
}
