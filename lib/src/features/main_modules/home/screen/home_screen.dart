import 'package:ifarmer/src/app_config/imports/import.dart';

class HomeScreen extends BaseView<HomeController> {
  HomeScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color pageBackgroundColor() {
    return AppColors.backgroundColor;
  }

  @override
  Widget body(BuildContext context) {
    return Obx(()=> Column(
      mainAxisAlignment: controller.ignore.isFalse ? startMAA : startMAA,
        children: [
          Carousel(imagePaths: controller.posterPaths.value,onPosterTap: (posterUrl) => controller.onTapItem(
              posterUrl: posterUrl,
              source: controller.posterResult
          )),
          RetCore.space(10.h),
          buildLatestMovies(
            imageUrls: controller.latestMoviePosterPaths.value, controller: controller,
          ),
        ],
      ),
    );
  }
}