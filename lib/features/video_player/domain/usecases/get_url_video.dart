import 'package:dartz/dartz.dart';
import 'package:seventh_player/cores/errors.dart';
import 'package:seventh_player/features/video_player/domain/entities/video_play_entity.dart';

abstract class GetUrlVideo {
  Future<Either<ErrorVideo, VideoPlayEntity>?> call();
}
