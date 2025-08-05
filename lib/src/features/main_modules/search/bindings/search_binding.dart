import 'package:ifarmer/src/app_config/imports/import.dart';


class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchItemController>(
            () => SearchItemController(),
        fenix: true
    );
  }
}
