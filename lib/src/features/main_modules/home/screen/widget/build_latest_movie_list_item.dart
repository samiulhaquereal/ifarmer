import 'package:ifarmer/src/app_config/imports/import.dart';

Widget buildLatestMovieListItem(HomeController controller, List<String> imageUrls, int index) {
  return InkWell(
    onTap: () => controller.onTapItem(posterUrl: imageUrls[index],source: controller.latestMovieResult),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Image.network(
          imageUrls[index],
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: AppColors.customGrayColor,
              child: Icon(Icons.broken_image, color: AppColors.whiteColor,size: 20.sp),
            );
          },
        ),
      ),
    ),
  );
}