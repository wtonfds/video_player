import 'package:dartz/dartz.dart';
import 'package:seventh_player/cores/errors.dart';
import 'package:seventh_player/features/login/domain/entities/login_entity.dart';

abstract class LoginRepository {
  Future<Either<ErrorOnApi, LoginEntity>?> login(
      String username, String password);
}
