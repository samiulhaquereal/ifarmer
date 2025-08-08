import 'package:ifarmer/src/app_config/imports/import.dart';

Widget buildLatestMovies({required List<String> imageUrls,required HomeController controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Text(
          AppStrings.latestMovie,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
          ),
        ),
      ),
      RetCore.space(10.h),
      buildLatestMovieList(controller, imageUrls),
    ],
  );
}