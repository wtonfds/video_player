import 'package:seventh_player/features/video_player/domain/entities/video_play_entity.dart';
import 'package:seventh_player/cores/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:seventh_player/features/video_player/domain/repositories/video_player_repository.dart';
import 'package:seventh_player/features/video_player/domain/usecases/get_url_video.dart';

class GeturlVideoImpl implements GetUrlVideo {
  final VideoPlayerRepository repository;

  GeturlVideoImpl(this.repository);
  @override
  Future<Either<ErrorVideo, VideoPlayEntity>?> call() {
    return repository.videoPlayer();
  }
}
