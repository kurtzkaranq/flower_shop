import 'package:flower_shop/logic/models/index.dart';

class ProductService {
  static final ProductService _singleton = ProductService._internal();
  factory ProductService() {
    return _singleton;
  }
  ProductService._internal();
  static String selectedType = '';
  static List<ProductModel> get getItemsByType {
    switch (selectedType.toLowerCase()) {
      case "trends":
        return trends;
      case "halloween":
        return halloween;
      default:
        return allProductsDistinctByName;
    }
  }

  static ProductModel? selectedProduct;
  static ProductModel get getSelectedProduct => selectedProduct ?? RedRose();

  static List<CategoryModel> get categories => [
        WeddingCategory(),
        BoxCategory(),
        BirthdayCategory(),
        RosesCategory(),
        ClassicCategory(),
        HalloweenCategory(),
      ];
  static List<ProductModel> get trends => [
        RedRose(),
        Bouquet(),
        Pastel(),
        BoxOfLove(),
      ];
  static List<ProductModel> get halloween => [
        Pastel(),
        BoxOfLove(),
        Monster(),
        Treat(),
      ];

  static List<ProductModel> get allProducts {
    return [...trends, ...halloween];
  }

  static List<ProductModel> get allProductsDistinctByName {
    final seenNames = <String>{};
    return allProducts.where((product) {
      final isNew = seenNames.add(product.name);
      return isNew;
    }).toList();
  }

  static List<ProductModel> favorites = [];

  static final List<ProductModel> _cart = [];

  static void addToCart(ProductModel model) {
    _cart.add(model);
  }

  static void removeFromCart(int index) {
    _cart.removeAt(index);
  }

  static List<ProductModel> get getCart {
    return _cart;
  }
}

class WeddingCategory extends CategoryModel {
  WeddingCategory({
    super.name = "for Wedding",
    super.path = "assets/images/wedding_cat.png",
  }) {
    products = [RedRose(), Bouquet(), Pastel()];
  }
}

class BoxCategory extends CategoryModel {
  BoxCategory({
    super.name = "Flowers in box",
    super.path = "assets/images/box_cat.png",
  }) {
    products = [
      BoxOfLove(),
      Bouquet(),
    ];
  }
}

class BirthdayCategory extends CategoryModel {
  BirthdayCategory({
    super.name = "for Birthday",
    super.path = "assets/images/bd_cat.png",
  }) {
    products = [BoxOfLove(), Bouquet(), RedRose()];
  }
}

class RosesCategory extends CategoryModel {
  RosesCategory({
    super.name = "Roses",
    super.path = "assets/images/rose_cat.png",
  }) {
    products = [
      RedRose(),
    ];
  }
}

class ClassicCategory extends CategoryModel {
  ClassicCategory({
    super.name = "Classic",
    super.path = "assets/images/classic_cat.png",
  }) {
    products = [
      RedRose(),
      Bouquet(),
    ];
  }
}

class HalloweenCategory extends CategoryModel {
  HalloweenCategory({
    super.name = "HalloweenCategory",
    super.path = "assets/images/hal_cat.png",
  }) {
    products = [Monster(), Treat(), Pastel(), BoxOfLove()];
  }
}

class RedRose extends ProductModel {
  RedRose({
    super.image = "assets/images/red_rose.png",
    super.name = "101 Red Roses",
    super.price = 150,
  });
}

class Bouquet extends ProductModel {
  Bouquet({
    super.image = "assets/images/bouquet.png",
    super.name = "Bouquet “Autumn”",
    super.price = 150,
  });
}

class Pastel extends ProductModel {
  Pastel({
    super.image = "assets/images/classic_cat.png",
    super.name = "Classic “ Pastel ”",
    super.price = 150,
  });
}

class BoxOfLove extends ProductModel {
  BoxOfLove({
    super.image = "assets/images/box_cat.png",
    super.name = "Box of love",
    super.price = 150,
  });
}

class Monster extends ProductModel {
  Monster({
    super.image = "assets/images/monster.png",
    super.name = "Bouquet “Monster”",
    super.price = 150,
  });
}

class Treat extends ProductModel {
  Treat({
    super.image = "assets/images/treat.png",
    super.name = "Box “trick or treaten”",
    super.price = 150,
  });
}
