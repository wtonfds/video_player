import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:seventh_player/features/login/domain/entities/login_entity.dart';
import 'package:seventh_player/features/login/domain/repositories/login_repository.dart';
import 'package:seventh_player/features/login/domain/usecases/get_token_from_api_impl.dart';

import 'get_token_from_api_impl_test.mocks.dart';

@GenerateMocks([LoginRepository])
void main() {
  final repository = MockLoginRepository();

  final usecase = GetTokenFromApiImpl(repository);
  test("SHOULD RETURN A TOKEN", () async {
    when(repository.login('', ''))
        .thenAnswer((_) async => Right(LoginEntity('', '')));

    final result = await usecase('', '');
    expect(result, isA<Right>());
  });
}
