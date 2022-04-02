// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_player_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VideoPlayerStore on _VideoPlayerStoreBase, Store {
  final _$fileNameAtom = Atom(name: '_VideoPlayerStoreBase.fileName');

  @override
  TextEditingController get fileName {
    _$fileNameAtom.reportRead();
    return super.fileName;
  }

  @override
  set fileName(TextEditingController value) {
    _$fileNameAtom.reportWrite(value, super.fileName, () {
      super.fileName = value;
    });
  }

  final _$urlModelAtom = Atom(name: '_VideoPlayerStoreBase.urlModel');

  @override
  VideoPlayerModel? get urlModel {
    _$urlModelAtom.reportRead();
    return super.urlModel;
  }

  @override
  set urlModel(VideoPlayerModel? value) {
    _$urlModelAtom.reportWrite(value, super.urlModel, () {
      super.urlModel = value;
    });
  }

  final _$statusVideoAtom = Atom(name: '_VideoPlayerStoreBase.statusVideo');

  @override
  int get statusVideo {
    _$statusVideoAtom.reportRead();
    return super.statusVideo;
  }

  @override
  set statusVideo(int value) {
    _$statusVideoAtom.reportWrite(value, super.statusVideo, () {
      super.statusVideo = value;
    });
  }

  final _$getUrlAsyncAction = AsyncAction('_VideoPlayerStoreBase.getUrl');

  @override
  Future<String?> getUrl() {
    return _$getUrlAsyncAction.run(() => super.getUrl());
  }

  final _$_VideoPlayerStoreBaseActionController =
      ActionController(name: '_VideoPlayerStoreBase');

  @override
  void setStatusVideo(int value) {
    final _$actionInfo = _$_VideoPlayerStoreBaseActionController.startAction(
        name: '_VideoPlayerStoreBase.setStatusVideo');
    try {
      return super.setStatusVideo(value);
    } finally {
      _$_VideoPlayerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fileName: ${fileName},
urlModel: ${urlModel},
statusVideo: ${statusVideo}
    ''';
  }
}
