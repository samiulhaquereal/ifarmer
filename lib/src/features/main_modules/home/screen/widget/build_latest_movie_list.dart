import 'package:ifarmer/src/app_config/imports/import.dart';

Widget buildLatestMovieList(HomeController controller, List<String> imageUrls) {
  return SizedBox(
    height: MediaQuery.of(controller.buildContext!).size.height * 0.3,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: imageUrls.length,
      separatorBuilder: (_, __) => SizedBox(width: 12.w),
      itemBuilder: (context, index) {
        return buildLatestMovieListItem(controller, imageUrls, index);
      },
    ),
  );
}