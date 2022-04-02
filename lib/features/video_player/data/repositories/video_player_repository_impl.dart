import 'package:seventh_player/cores/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:seventh_player/features/video_player/data/datasource/video_player_datasource.dart';
import 'package:seventh_player/features/video_player/data/model/video_player_model.dart';
import 'package:seventh_player/features/video_player/domain/entities/video_play_entity.dart';
import 'package:seventh_player/features/video_player/domain/repositories/video_player_repository.dart';

class VideoPlayerRepositoryImpl implements VideoPlayerRepository {
  final VideoPlayerDatasource datasource;
  String fileName;

  VideoPlayerRepositoryImpl(this.datasource, this.fileName);

  @override
  Future<Either<ErrorVideo, VideoPlayEntity>?> videoPlayer() async {
    try {
      final response = await datasource.getUrl(fileName);
      return Right(response!);
    } catch (e) {
      return Left(ErrorVideo());
    }
  }
}
