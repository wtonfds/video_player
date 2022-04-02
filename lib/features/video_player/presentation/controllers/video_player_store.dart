import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:seventh_player/features/video_player/data/model/video_player_model.dart';
import 'package:seventh_player/features/video_player/external/video_player_api.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'video_player_store.g.dart';

class VideoPlayerStore = _VideoPlayerStoreBase with _$VideoPlayerStore;

abstract class _VideoPlayerStoreBase with Store {
  final VideoPlayerApi videoPlayerApi;

  _VideoPlayerStoreBase(this.videoPlayerApi);

  @observable
  TextEditingController fileName = TextEditingController();

  @observable
  VideoPlayerModel? urlModel = VideoPlayerModel();

  @observable
  int statusVideo = 0;

  @action
  void setStatusVideo(int value) {
    statusVideo = value;
  }

  Future<void> initializeVideoDependencies() {
    return Future.delayed(const Duration(seconds: 2))
        .then((_) => Modular.to.navigate('/video'));
  }

  @action
  Future<String?> getUrl() async {
    final video = await videoPlayerApi.getUrl(fileName.text);
    if (video != null) {
      setStatusVideo(1);
      initializeVideoDependencies();
    } else {
      setStatusVideo(2);
    }
    urlModel = video;

    return urlModel?.url;
  }
}
