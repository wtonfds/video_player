import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mobx/mobx.dart';
import 'package:seventh_player/cores/validators.dart';
import 'package:seventh_player/features/login/external/login_api.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final LoginApi loginApi;

  _LoginStoreBase(this.loginApi);

  final LocalStorage storage = LocalStorage('token');

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController usernamecontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  @observable
  int statusCode = 0;

  @action
  void codeUnauthorized() {
    statusCode = 401;
  }

  @action
  void codeOK() {
    statusCode = 200;
  }

  @action
  verifyInternet() {
    statusCode = 400;
  }

  Future<void> initializeLoginDependencies() {
    return Future.delayed(const Duration(seconds: 2))
        .then((_) => Modular.to.navigate('/home'));
  }

  @action
  Future<bool> loggin(String username, String password) async {
    if (formKey.currentState!.validate()) {
      final response = await loginApi.getToken(username, password);

      if (response!.isRight()) {
        storage.setItem('get_username', usernamecontroller.text);
        codeOK();
        initializeLoginDependencies();
        return true;
      } else if (response.isLeft()) {
        codeUnauthorized();
        return false;
      } else {
        verifyInternet();
        return false;
      }
    } else {
      return false;
    }
  }
}
