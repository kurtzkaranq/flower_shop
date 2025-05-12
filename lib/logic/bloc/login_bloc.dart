import 'package:flower_shop/logic/clients/firebase_client.dart';
import 'package:flower_shop/logic/models/alert_model.dart';
import 'package:flower_shop/utils/sync_data.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc implements LoginBlocAbstract {
  LoginBloc({required this.client}) {
    checkUser();
  }
  final FirebaseClient client;
  String username = '';
  String password = '';
  final loginSubject = PublishSubject<bool>();
  final errorSubject = BehaviorSubject<AlertModel>();

  @override
  Future<void> checkUser() async {}

  @override
  Future<bool> login() async {
    return username == "testuser" && password == "Qwer@123";
  }

  @override
  Future<void> signUp() async {}

  @override
  Future<void> toNextScreen() async {
    loginSubject.add(true);
  }

  Future<void> loginAsGuest() async {
    toNextScreen();
  }

  Future<void> loginByUsername() async {
    await login().then((res) async {
      if (res) {
        SyncData().username = username;
        await toNextScreen();
        return;
      }
      errorSubject
          .add(AlertModel(title: "Уучлаарай", body: "Буруу нэвтрэх нэр"));
    });
  }
}

abstract class LoginBlocAbstract {
  Future<void> checkUser();
  Future<bool> login();
  Future<void> signUp();
  Future<void> toNextScreen();
}
