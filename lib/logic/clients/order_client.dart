import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flower_shop/logic/models/order_model.dart';
import 'package:flower_shop/logic/models/product_model.dart';
import 'package:flower_shop/utils/sync_data.dart';

class OrderClient {
  static final OrderClient _singleton =
      OrderClient._internal(FirebaseFirestore.instance);
  factory OrderClient() {
    return _singleton;
  }
  OrderClient._internal(this.firebaseFirestore);

  final FirebaseFirestore firebaseFirestore;
  OrderModel orderModel = OrderModel(
    contactDetail: ContactDetail(),
    deliveryInformation: DeliveryInformation(),
    deliveryOption: DeliveryOption(),
  );

  Future<void> createOrderForUser({
    required String username,
    required List<ProductModel> products,
  }) async {
    try {
      final List<Map<String, dynamic>> productMaps = products
          .map((product) => {
                'name': product.name,
                'image': product.image,
                'price': product.price,
                'quantity': product.quantity,
                'rating': product.rating,
                'totalPrice': product.totalPrice,
              })
          .toList();

      ContactDetail contact = orderModel.contactDetail;
      final Map<String, dynamic> contactDetail = {
        "email": contact.email,
        "firstname": contact.firstname,
        "lastname": contact.lastname,
        "phoneNumber": contact.phoneNumber,
      };
      DeliveryInformation deliveryInformation = orderModel.deliveryInformation;
      final Map<String, dynamic> delivery = {
        "addressDetail": deliveryInformation.addressDetail,
        "city": deliveryInformation.city,
        "country": deliveryInformation.country,
        "postalCode": deliveryInformation.postalCode,
        "street": deliveryInformation.street,
      };

      final userOrderRef = firebaseFirestore.collection('orders').doc(username);

      await userOrderRef.collection('user_orders').add({
        'products': productMaps,
        'createdAt': FieldValue.serverTimestamp(),
        'contact_detail': contactDetail,
        'delivery_information': delivery
      });

      log('Order placed successfully for user $username.');
    } catch (e) {
      log('Error placing order: $e');
    }
  }

  Future<List<OrderModel>> getOrders() async {
    List<OrderModel> orders = [];

    try {
      final QuerySnapshot orderSnapshot = await firebaseFirestore
          .collection('orders')
          .doc(SyncData().username)
          .collection('user_orders')
          .orderBy('createdAt', descending: true)
          .get();

      for (var doc in orderSnapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        print(data['contact_detail']['firstname']);

        final contact = ContactDetail()
          ..firstname = data['contact_detail']['firstname'] ?? ''
          ..lastname = data['contact_detail']['lastname'] ?? ''
          ..email = data['contact_detail']['email'] ?? ''
          ..phoneNumber = data['contact_detail']['phoneNumber'] ?? '';
        final deliveryInfo = DeliveryInformation()
          ..country = data['delivery_information']['country'] ?? ''
          ..city = data['delivery_information']['city'] ?? ''
          ..postalCode = data['delivery_information']['postalCode'] ?? ''
          ..street = data['delivery_information']['street'] ?? ''
          ..addressDetail = data['delivery_information']['addressDetail'] ?? '';

        final List<ProductModel> products =
            (data['products'] as List<dynamic>? ?? [])
                .map((product) => ProductModel(
                    image: product['image'] ?? '',
                    name: product['name'] ?? '',
                    price: (product['price'] ?? 0).toDouble(),
                    quantity: product['quantity'] ?? 1,
                    rating: product['rating'] ?? '4.89',
                    type: product["type"] ?? ''))
                .toList();

        orders.add(OrderModel(
          contactDetail: contact,
          deliveryInformation: deliveryInfo,
          deliveryOption: DeliveryOption(),
          products: products,
        ));
      }
      return orders;
    } catch (e) {
      print('Error fetching user orders: $e');
      return [];
    }
  }
}
