import 'package:seventh_player/features/video_player/domain/entities/video_play_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_player_model.g.dart';

@JsonSerializable()
class VideoPlayerModel implements VideoPlayEntity {
  String? message;

  String? url;

  VideoPlayerModel({this.message, this.url});

  factory VideoPlayerModel.fromJson(Map<String, dynamic> json) =>
      _$VideoPlayerModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoPlayerModelToJson(this);
}
