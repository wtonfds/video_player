import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:connectivity/connectivity.dart';

part 'splash_screen_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  @observable
  String status = '';

  @action
  Future<void> checkConnection() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        status = '';
      } else {
        status = 'Erro na Conexão!!!..';
      }
    } catch (e) {}
  }

  Future<void> initializeLoginDependencies() {
    return Future.delayed(const Duration(seconds: 2))
        .then((_) => Modular.to.navigate('/login'));
  }
}
