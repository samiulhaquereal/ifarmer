import 'package:ifarmer/src/app_config/imports/import.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
            () => HomeController(),
        fenix: true
    );
  }
}
