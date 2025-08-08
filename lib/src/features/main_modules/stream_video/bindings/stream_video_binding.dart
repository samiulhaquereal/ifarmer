import 'package:ifarmer/src/app_config/imports/import.dart';

class StreamVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StreamVideoController>(
            () => StreamVideoController(),
        fenix: true
    );
  }
}
