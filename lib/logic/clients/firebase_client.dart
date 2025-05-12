import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flower_shop/logic/models/index.dart';

class FirebaseClient {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<ResponseModel> checkUser(String username, String password) async {
    return ResponseModel();
  }

  Future<ResponseModel<List<OrderModel>>> getOrders() async {
    throw UnimplementedError();
  }

  Future<ResponseModel<UserModel>> getUserInfo() async {
    throw UnimplementedError();
  }

  Future<ResponseModel> login() async {
    return ResponseModel();
  }

  Future<ResponseModel> orderProducts({required OrderModel order}) async {
    return ResponseModel();
  }

  Future<ResponseModel> signUp() async {
    return ResponseModel();
  }

  Future<List<ProductModel>> getAllProducts() async {
    return (await getFromDb("products"))
        .map((e) => ProductModel.fromMap(e.data() as Map<String, dynamic>))
        .toList();
  }

  Future<List<CategoryModel>> getAllCategoriesWithProducts() async {
    try {
      QuerySnapshot categorySnapshot =
          await firebaseFirestore.collection('categories').get();

      List<CategoryModel> categories = [];

      for (var doc in categorySnapshot.docs) {
        final category =
            CategoryModel.fromMap(doc.data() as Map<String, dynamic>);

        QuerySnapshot productSnapshot =
            await doc.reference.collection('products').get();

        List<ProductModel> products = productSnapshot.docs
            .map((pDoc) =>
                ProductModel.fromMap(pDoc.data() as Map<String, dynamic>))
            .toList();

        category.products = products;

        categories.add(category);
      }

      return categories;
    } catch (e) {
      return [];
    }
  }

  Future<List<QueryDocumentSnapshot>> getFromDb(String collection) async {
    try {
      QuerySnapshot snapshot =
          await firebaseFirestore.collection(collection).get();
      return snapshot.docs;
    } catch (e) {
      return [];
    }
  }
}
