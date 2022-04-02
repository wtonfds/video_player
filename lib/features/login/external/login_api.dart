import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:seventh_player/cores/errors.dart';
import 'package:seventh_player/cores/message.dart';
import 'package:seventh_player/features/login/data/datasources/login_datasource.dart';
import 'package:seventh_player/features/login/data/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class LoginApi implements LoginDatasource {
  @override
  Future<Either<ErrorOnApi, LoginModel>?> getToken(
      String username, String password) async {
    var _data = {"username": "$username", "password": "$password"};
    var url = Uri.parse('https://mobiletest.seventh.com.br/login');
    final response = await http.post(url, body: _data);

    final LocalStorage storage = LocalStorage('token');

    try {
      if (response.statusCode == 200) {
        final model = LoginModel.fromJson(jsonDecode(response.body));
        storage.setItem('get_token', model.token.toString());

        return Right(model);
      } else if (response.statusCode == 401) {
        final model = LoginModel.fromJson(jsonDecode(response.body));

        return Left(ErrorOnApi(model.message.toString()));
      }
    } catch (e) {
      return Left(ErrorOnApi(e.toString()));
    }
  }
}
