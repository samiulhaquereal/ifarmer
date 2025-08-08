import 'package:ifarmer/src/app_config/imports/import.dart';

Widget buildLatestMovieList(HomeController controller) {
  final scrollController = ScrollController();

  scrollController.addListener(() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 100) {
      if (!controller.isLoadingMore.value) {
        controller.getLatestMoviePoster(loadMore: true);
      }
    }
  });

  return Obx(() {
    return SizedBox(
      height: MediaQuery.of(controller.buildContext!).size.height * 0.3,
      child: ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: controller.latestMoviePosterPaths.length +
            (controller.isLoadingMore.value ? 1 : 0),
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          if (index < controller.latestMoviePosterPaths.length) {
            return buildLatestMovieListItem(
              controller,
              controller.latestMoviePosterPaths,
              index,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  });
}