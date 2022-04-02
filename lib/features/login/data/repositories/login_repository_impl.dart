import 'package:seventh_player/cores/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:seventh_player/features/login/data/datasources/login_datasource.dart';
import 'package:seventh_player/features/login/data/models/login_model.dart';
import 'package:seventh_player/features/login/domain/entities/login_entity.dart';
import 'package:seventh_player/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl(this.datasource);

  @override
  Future<Either<ErrorOnApi, LoginEntity>?> login(
      String username, String password) async {
    try {
      final response = await datasource.getToken(username, password);
      return response;
    } catch (e) {
      return Left(ErrorOnApi(e.toString()));
    }
  }
}
