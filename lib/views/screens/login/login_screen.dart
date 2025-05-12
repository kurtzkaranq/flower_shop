import 'dart:async';

import 'package:flower_shop/logic/bloc/login_bloc.dart';
import 'package:flower_shop/logic/clients/firebase_client.dart';
import 'package:flower_shop/logic/models/alert_model.dart';
import 'package:flower_shop/utils/fs_textstyle.dart';
import 'package:flower_shop/views/components/fs_button.dart';
import 'package:flower_shop/views/screens/tabbar/tabbar_screen.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final StreamSubscription nextListener, errorListener;
  LoginBloc bloc = LoginBloc(
    client: FirebaseClient(),
  );
  @override
  void dispose() {
    nextListener.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    errorListener = bloc.errorSubject.listen((value) {
      final dialog = FsAlert(
        context: context,
        type: FsAlertType.information,
        body: value.body,
        title: value.title,
      );
      dialog.show();
    });
    nextListener = bloc.loginSubject.listen((value) {
      if (value) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          TabbarScreen.routeName,
          ModalRoute.withName(TabbarScreen.routeName),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFF0DB),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/login_bg.png"))),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Image.asset(
              "assets/icons/logo.png",
              height: 46,
            ),
            const SizedBox(height: 60),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Log in',
                    style: FsTextstyle.header,
                    // style: TextStyle(
                    //   fontSize: 24,
                    //   fontWeight: FontWeight.w600,
                    //   color: Colors.green,
                    // ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    onChanged: (value) {
                      bloc.username = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Username',
                      filled: true,
                      fillColor: const Color(0xFFF5F5F5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    onChanged: (value) {
                      bloc.password = value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      fillColor: const Color(0xFFF5F5F5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text.rich(
                        TextSpan(
                          text: 'Forgot your ',
                          children: [
                            TextSpan(
                              text: 'Password ? Click here',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: FsButton.mainButton(
                      title: "Log in",
                      onClick: () async {
                        bloc.loginByUsername();
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(thickness: 1.0),
                  const SizedBox(height: 8),
                  const Center(
                    child: Text(
                      'Continue with',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      _SocialIconButton(icon: FontAwesomeIcons.google),
                      _SocialIconButton(icon: FontAwesomeIcons.apple),
                      _SocialIconButton(icon: FontAwesomeIcons.facebookF),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Center(child: Text('OR')),
                  const SizedBox(height: 12),
                  FsButton.secondaryButton(
                      title: "Continue as guest",
                      onClick: () {
                        bloc.loginAsGuest();
                      }),
                  const SizedBox(height: 20),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: "Don’t have an account ? ",
                        children: [
                          TextSpan(
                            text: "Sign up",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      style: const TextStyle(fontSize: 14),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialIconButton extends StatelessWidget {
  final IconData icon;

  const _SocialIconButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: const Color(0xFFF1F1F1),
      child: IconButton(
        icon: FaIcon(icon, color: Colors.black),
        onPressed: () {},
      ),
    );
  }
}
