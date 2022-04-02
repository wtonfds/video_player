import 'package:seventh_player/features/login/domain/entities/login_entity.dart';
import 'package:seventh_player/cores/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:seventh_player/features/login/domain/repositories/login_repository.dart';
import 'package:seventh_player/features/login/domain/usecases/get_token_from_api.dart';

class GetTokenFromApiImpl implements GetTokenFromApi {
  final LoginRepository repository;

  GetTokenFromApiImpl(this.repository);

  @override
  Future<Either<ErrorOnApi, LoginEntity>?> call(
      String username, String password) {
    return repository.login(username, password);
  }
}
