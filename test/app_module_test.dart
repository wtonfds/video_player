import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seventh_player/app_module.dart';
import 'package:seventh_player/features/login/data/models/login_model.dart';
import 'package:seventh_player/features/login/domain/entities/login_entity.dart';
import 'package:seventh_player/features/login/domain/usecases/get_token_from_api.dart';
import 'package:seventh_player/features/login/domain/usecases/get_token_from_api_impl.dart';

void main() {
  Modular.init(AppModule());

  test('should retrieve usecase without error', () {
    final usecase = Modular.get<GetTokenFromApi>();
    expect(usecase, isA<GetTokenFromApiImpl>());
  });

  test('should retrieve token value', () async {
    final usecase = Modular.get<GetTokenFromApi>();
    final result = await usecase('candidato-seventh', '8n5zSrYq');
    expect(result, isA<LoginEntity>());
  });
}
