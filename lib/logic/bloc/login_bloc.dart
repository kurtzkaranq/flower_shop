import 'package:flower_shop/logic/clients/firebase_client.dart';

class LoginBloc implements LoginBlocAbstract {
  LoginBloc({required this.client}) {
    checkUser();
  }
  final FirebaseClient client;
  @override
  Future<void> checkUser() async {}

  @override
  Future<void> login() async {}

  @override
  Future<void> signUp() async {}

  @override
  Future<void> toNextScreen() async {}
}

abstract class LoginBlocAbstract {
  Future<void> checkUser();
  Future<void> login();
  Future<void> signUp();
  Future<void> toNextScreen();
}
