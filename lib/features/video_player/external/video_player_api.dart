import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:seventh_player/cores/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:seventh_player/features/video_player/data/datasource/video_player_datasource.dart';
import 'package:seventh_player/features/video_player/data/model/video_player_model.dart';
import 'package:http/http.dart' as http;

class VideoPlayerApi implements VideoPlayerDatasource {
  @override
  Future<VideoPlayerModel?> getUrl(String fileName) async {
    var url = Uri.parse('https://mobiletest.seventh.com.br/video/$fileName');
    final LocalStorage storage = LocalStorage('token');
    var token = storage.getItem('get_token');

    Map<String, String> requestHeaders = {'X-Access-Token': '$token'};
    final response = await http.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      final urlVideo = VideoPlayerModel.fromJson(jsonDecode(response.body));
      return urlVideo;
    } else if (response.statusCode == 404) {
      return null;
    }
  }
}
