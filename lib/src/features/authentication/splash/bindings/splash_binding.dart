import 'package:ifarmer/src/app_config/imports/import.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
