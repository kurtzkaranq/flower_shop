import 'package:flower_shop/logic/models/index.dart';

class OrderModel {
  OrderModel({
    required this.contactDetail,
    required this.deliveryInformation,
    required this.deliveryOption,
    this.products = const [],
  });
  ContactDetail contactDetail;
  DeliveryInformation deliveryInformation;
  DeliveryOption deliveryOption;
  List<ProductModel> products;
}

class ContactDetail {
  String firstname = '';
  String lastname = '';
  String email = '';
  String phoneNumber = '';
}

class DeliveryInformation {
  String country = '';
  String city = '';
  String postalCode = '';
  String street = '';
  String addressDetail = '';

  String get detail {
    return "$country , $city , $postalCode , $street";
  }
}

class DeliveryOption {
  int type = 0;
}
