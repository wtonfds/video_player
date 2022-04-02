import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:seventh_player/cores/app_colors.dart';
import 'package:seventh_player/cores/wave_widget.dart';
import 'package:seventh_player/features/splash/presentation/controller/splash_screen_store.dart';

class RetryConnectionPage extends StatefulWidget {
  const RetryConnectionPage();

  @override
  _RetryConnectionPageState createState() => _RetryConnectionPageState();
}

class _RetryConnectionPageState
    extends ModularState<RetryConnectionPage, SplashStore> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height,
            color: AppColors.primaryDark,
            padding: EdgeInsets.only(top: size.height * .23),
            child: Column(
              children: [
                Center(
                    child: Image.asset('assets/images/seventh.png',
                        width: 250.0, height: 200.21)),
              ],
            ),
          ),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutQuad,
              top: keyboardOpen ? size.height / 3.7 : 0.0,
              child: WaveWidget(
                  size: size, yOffset: size.height / 2, color: Colors.white)),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 140),
                child: controller.status != ''
                    ? Column(
                        children: [
                          const Icon(Icons.error, color: Colors.blue, size: 60),
                          Text('${controller.status},  Try again',
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 22)),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.blue),
                            onPressed: () => controller.checkConnection(),
                            child: const Text('Tentar Novamente',
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      )
                    : const SpinKitSpinningLines(color: AppColors.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
