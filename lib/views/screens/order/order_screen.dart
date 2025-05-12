import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flower_shop/logic/bloc/order/order_bloc.dart';
import 'package:flower_shop/logic/clients/order_client.dart';
import 'package:flower_shop/utils/fs_color.dart';
import 'package:flower_shop/utils/fs_textstyle.dart';
import 'package:flower_shop/views/components/fs_app_bar.dart';
import 'package:flower_shop/views/components/fs_bottom_notch.dart';
import 'package:flower_shop/views/components/fs_button.dart';
import 'package:flower_shop/views/screens/order/order_confirmation_screen.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});
  static const routeName = "OrderScreen";
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final OrderBloc bloc = OrderBloc(
    client: OrderClient(),
  );
  int selectedShipping = 0;

  final _contactFormKey = GlobalKey<FormState>();
  final _deliveryFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FsAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/icons/ic_one.png",
                    height: 30,
                  ),
                  Text(
                    " Select shipping method",
                    style: FsTextstyle.secondary.copyWith(
                      color: FsColor.darkGreen,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: FsColor.lighterGreen,
                  ),
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    _shippingOption("Home delivery", "(1-3 business days)", 0),
                    _shippingOption("Pickup Point", "(2-5 business days)", 1),
                    _shippingOption(
                        "Pickup in Store", "(2-5 business days)", 2),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Image.asset(
                "assets/icons/ic_divider.png",
                width: double.infinity,
              ),

              const SizedBox(height: 16),
              Row(
                children: [
                  Image.asset(
                    "assets/icons/ic_two.png",
                    height: 30,
                  ),
                  Text(
                    " Fill the information below",
                    style: FsTextstyle.secondary.copyWith(
                      color: FsColor.darkGreen,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),

              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: FsColor.lighterGreen,
                    ),
                    borderRadius: BorderRadius.circular(
                      16,
                    ),
                    color: FsColor.white),
                child: Form(
                  key: _contactFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "*Contact details",
                        style: FsTextstyle.secondary,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      FsFormIput(
                        label: "First name",
                        onChanged: (value) {
                          bloc.client.orderModel.contactDetail.firstname =
                              value;
                        },
                      ),
                      FsFormIput(
                          label: "Last name",
                          onChanged: (value) {
                            bloc.client.orderModel.contactDetail.lastname =
                                value;
                          }),
                      FsFormIput(
                          label: "Email",
                          onChanged: (value) {
                            bloc.client.orderModel.contactDetail.email = value;
                          }),
                      FsFormIput(
                          label: "Phone number",
                          onChanged: (value) {
                            bloc.client.orderModel.contactDetail.phoneNumber =
                                value;
                          }),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 16,
              ),
              Image.asset(
                "assets/icons/ic_divider.png",
                width: double.infinity,
              ),

              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: FsColor.lighterGreen,
                    ),
                    borderRadius: BorderRadius.circular(
                      16,
                    ),
                    color: FsColor.white),
                child: Form(
                  key: _deliveryFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "*Delivery information",
                        style: FsTextstyle.secondary,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      FsFormIput(
                          label: "Country",
                          onChanged: (value) {
                            bloc.client.orderModel.deliveryInformation.country =
                                value;
                          }),
                      Row(
                        children: [
                          Expanded(
                            child: FsFormIput(
                                label: "City",
                                onChanged: (value) {
                                  bloc.client.orderModel.deliveryInformation
                                      .city = value;
                                }),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                              child: FsFormIput(
                                  label: "Postal code",
                                  onChanged: (value) {
                                    bloc.client.orderModel.deliveryInformation
                                        .postalCode = value;
                                  })),
                        ],
                      ),
                      FsFormIput(
                          label: "Street",
                          onChanged: (value) {
                            bloc.client.orderModel.deliveryInformation.street =
                                value;
                          }),
                      FsFormIput(
                          label: "Address details (optional)",
                          onChanged: (value) {
                            bloc.client.orderModel.deliveryInformation
                                .addressDetail = value;
                          }),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24),
              FsButton(
                  title: "Checkout",
                  onClick: () {
                    Navigator.pushNamed(
                      context,
                      OrderConfirmationScreen.routeName,
                    );
                  }),
              const FsBottomNotch()
              // ElevatedButton(
              //   onPressed: () {
              //     if (_contactFormKey.currentState!.validate() &&
              //         _deliveryFormKey.currentState!.validate()) {
              //       // Navigator.push(
              //       //   context,
              //       //   MaterialPageRoute(builder: (_) => CheckoutPaymentScreen()),
              //       // );
              //     }
              //   },
              //   child: Text("Checkout"),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _shippingOption(String title, String subtitle, int index) {
    return Column(children: [
      RadioListTile(
        activeColor: FsColor.mainGreen,
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("$subtitle\nFree"),
        value: index,
        groupValue: selectedShipping,
        onChanged: (val) {
          setState(() => selectedShipping = val!);
          bloc.client.orderModel.deliveryOption.type = val!;
        },
      ),
      const SizedBox(
        height: 4,
      ),
      index != 2
          ? const Divider(
              color: FsColor.lighterGreen,
            )
          : Container()
    ]);
  }
}

class FsFormIput extends StatelessWidget {
  const FsFormIput({super.key, required this.label, required this.onChanged});
  final String label;
  final Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(
        8,
      ),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color: FsColor.lighterGreen,
        ),
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: FsTextstyle.secondary.copyWith(
            color: Colors.grey,
            height: 0.8,
          ),
          alignLabelWithHint: false,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          counterText: '',
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
