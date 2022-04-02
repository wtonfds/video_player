import 'package:dartz/dartz.dart';
import 'package:seventh_player/cores/errors.dart';
import 'package:seventh_player/features/video_player/data/model/video_player_model.dart';

abstract class VideoPlayerDatasource {
  Future<VideoPlayerModel?> getUrl(String fileName);
}
