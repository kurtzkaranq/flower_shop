import 'package:flower_shop/utils/fs_textstyle.dart';
import 'package:flower_shop/utils/sync_data.dart';
import 'package:flower_shop/views/components/fs_button.dart';
import 'package:flower_shop/views/screens/login/login_screen.dart';
import 'package:flower_shop/views/screens/order/order_history_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/login_bg.png"))),
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "assets/icons/logo.png",
                  height: 48,
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              Image.asset(
                "assets/icons/ic_profile.png",
                width: 150,
              ),
              Text(
                "Hello, ",
                style: FsTextstyle.body.copyWith(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "${SyncData().username} !",
                style: FsTextstyle.header,
              ),
              const SizedBox(
                height: 128,
              ),
              FsButton(
                title: "My Orders",
                onClick: () {
                  Navigator.pushNamed(context, OrderHistoryScreen.routeName);
                },
                type: FsButtonType.secondary,
              ),
              const SizedBox(
                height: 8,
              ),
              FsButton(
                title: "Sign out",
                onClick: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    LoginScreen.routeName,
                    ModalRoute.withName(LoginScreen.routeName),
                  );
                },
                type: FsButtonType.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
