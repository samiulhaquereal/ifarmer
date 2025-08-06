import 'package:ifarmer/src/app_config/imports/import.dart';

class MovieDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDetailsController>(
            () => MovieDetailsController(),
        fenix: true
    );
  }
}
