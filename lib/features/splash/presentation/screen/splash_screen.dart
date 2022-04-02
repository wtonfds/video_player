import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seventh_player/features/splash/presentation/controller/splash_screen_store.dart';
import 'package:seventh_player/features/splash/presentation/screen/retry_connection_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ModularState<SplashScreen, SplashStore> {
  @override
  void initState() {
    super.initState();
    controller.initializeLoginDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.checkConnection(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text(snapshot.error.toString())),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }
        return const RetryConnectionPage();
      },
    );
  }
}
