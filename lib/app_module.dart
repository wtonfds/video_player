import 'package:flutter_modular/flutter_modular.dart';
import 'package:seventh_player/features/login/data/models/login_model.dart';
import 'package:seventh_player/features/login/data/repositories/login_repository_impl.dart';
import 'package:seventh_player/features/login/domain/usecases/get_token_from_api_impl.dart';
import 'package:seventh_player/features/login/external/login_api.dart';
import 'package:seventh_player/features/login/presentation/controllers/login_store.dart';
import 'package:seventh_player/features/login/presentation/pages/login_page.dart';
import 'package:seventh_player/features/splash/presentation/controller/splash_screen_store.dart';
import 'package:seventh_player/features/splash/presentation/screen/splash_screen.dart';
import 'package:seventh_player/features/video_player/data/repositories/video_player_repository_impl.dart';
import 'package:seventh_player/features/video_player/domain/usecases/get_url_video_impl.dart';
import 'package:seventh_player/features/video_player/external/video_player_api.dart';
import 'package:seventh_player/features/video_player/presentation/controllers/video_player_store.dart';
import 'package:seventh_player/features/video_player/presentation/pages/home_page.dart';
import 'package:seventh_player/features/video_player/presentation/pages/video_player_page.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => LoginStore(i.get())),
        Bind.lazySingleton((i) => LoginApi()),
        Bind.lazySingleton((i) => SplashStore()),
        Bind.lazySingleton((i) => LoginRepositoryImpl(i.get())),
        Bind.lazySingleton((i) => GetTokenFromApiImpl(i.get())),
        Bind.lazySingleton((i) => VideoPlayerRepositoryImpl(i.get(), i.get())),
        Bind.lazySingleton((i) => GeturlVideoImpl(i.get())),
        Bind.lazySingleton((i) => VideoPlayerStore(i.get())),
        Bind.lazySingleton((i) => VideoPlayerApi()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (_, args) => const SplashScreen()),
        ChildRoute('/login', child: (_, args) => const LoginPage()),
        ChildRoute('/video', child: (_, args) => const VideoPlayerPage()),
        ChildRoute('/home', child: (_, args) => const HomePage()),
      ];
}
