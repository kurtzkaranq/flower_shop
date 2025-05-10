import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flower_shop/logic/models/index.dart';

class FirebaseClient implements FirebaseClientAbstract {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<ResponseModel> checkUser() async {
    return ResponseModel();
  }

  @override
  Future<ResponseModel<List<OrderModel>>> getOrders() async {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel<UserModel>> getUserInfo() async {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> login() async {
    return ResponseModel();
  }

  @override
  Future<ResponseModel> orderProducts({required OrderModel order}) async {
    return ResponseModel();
  }

  @override
  Future<ResponseModel> signUp() async {
    return ResponseModel();
  }
}

abstract class FirebaseClientAbstract {
  Future<ResponseModel> checkUser();
  Future<ResponseModel> login();
  Future<ResponseModel> signUp();
  Future<ResponseModel> orderProducts({required OrderModel order});
  Future<ResponseModel<List<OrderModel>>> getOrders();
  Future<ResponseModel<UserModel>> getUserInfo();
}
