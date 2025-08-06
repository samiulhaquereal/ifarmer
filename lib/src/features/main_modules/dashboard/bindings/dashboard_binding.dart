import 'package:ifarmer/src/app_config/imports/import.dart';


class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
            () => DashboardController(),
        fenix: true
    );
    Get.lazyPut<HomeController>(
            () => HomeController(),
        fenix: true
    );
    Get.lazyPut<SearchItemController>(
            () => SearchItemController(),
        fenix: true
    );
  }
}

