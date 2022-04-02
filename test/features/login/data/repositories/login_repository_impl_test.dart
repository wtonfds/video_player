import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:seventh_player/features/login/data/datasources/login_datasource.dart';
import 'package:seventh_player/features/login/data/models/login_model.dart';
import 'package:seventh_player/features/login/data/repositories/login_repository_impl.dart';
import 'package:seventh_player/features/login/domain/entities/login_entity.dart';

import 'login_repository_impl_test.mocks.dart';

@GenerateMocks([LoginDatasource])
void main() {
  final datasource = MockLoginDatasource();
  final repository = LoginRepositoryImpl(datasource);

  test("Should return a value token", () async {
    when(datasource.getToken('', ''))
        .thenAnswer((_) async => Right(LoginModel(token: '')));
    final response = await repository.login('', '');
    expect(response, isA());
  });
}
