import 'package:dartz/dartz.dart';
import 'package:seventh_player/cores/errors.dart';
import 'package:seventh_player/features/login/data/models/login_model.dart';

abstract class LoginDatasource {
  Future<Either<ErrorOnApi, LoginModel>?> getToken(
      String username, String password);
}
