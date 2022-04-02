import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:seventh_player/features/video_player/domain/entities/video_play_entity.dart';
import 'package:seventh_player/features/video_player/domain/repositories/video_player_repository.dart';
import 'package:seventh_player/features/video_player/domain/usecases/get_url_video_impl.dart';

import 'get_url_video_impl_test.mocks.dart';

@GenerateMocks([VideoPlayerRepository])
void main() {
  final repository = MockVideoPlayerRepository();

  final usecase = GeturlVideoImpl(repository);

  test('SHOULD RETURN A URL VIDEO', () async {
    when(repository.videoPlayer())
        .thenAnswer((_) async => Right(VideoPlayEntity('', '')));

    final result = await usecase();
    expect(result, isA<Right>());
  });
}
