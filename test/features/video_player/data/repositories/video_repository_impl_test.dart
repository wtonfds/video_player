import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart' as mock;
import 'package:seventh_player/features/video_player/data/datasource/video_player_datasource.dart';
import 'package:seventh_player/features/video_player/data/model/video_player_model.dart';
import 'package:seventh_player/features/video_player/data/repositories/video_player_repository_impl.dart';

import 'video_repository_impl_test.mocks.dart';

@GenerateMocks([VideoPlayerDatasource])
void main() {
  final datasource = MockVideoPlayerDatasource();
  final repository = VideoPlayerRepositoryImpl(datasource, '');

  test('Should return a url video', () async {
    mock
        .when(repository.videoPlayer())
        .thenAnswer((_) async => Right(VideoPlayerModel(message: '', url: '')));

    final response = await repository.videoPlayer();
    expect(response, isA());
  });
}
