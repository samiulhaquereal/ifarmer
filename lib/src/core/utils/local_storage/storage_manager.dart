import 'package:ifarmer/src/app_config/imports/import.dart';

class StorageManager extends BaseController {

  static StorageManager? _instance;
  StorageManager._internal();
  factory StorageManager(){
    _instance ??= StorageManager._internal();
    return _instance!;
  }

  Future<void> setVideoLastPosition({
    required int videoLastPosition,
  }) async {
    storage.write(PrefsKeys.videoLastPosition, videoLastPosition);
  }

  Future<int?> getVideoLastPosition() async {
    return storage.read(PrefsKeys.videoLastPosition);
  }

}
