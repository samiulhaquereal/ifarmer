import 'package:ifarmer/src/app_config/imports/import.dart';

Widget buildTags(MovieDetailsModel? movie) {
  final ratingValue = movie?.imdbRating != null && movie!.ratings!.isNotEmpty
      ? movie.imdbRating : '-';
  return Row(
    children: [
      tag(AppStrings.premium, background: AppColors.orangeColor),
      SizedBox(width: 8),
      tag(movie?.rated ?? '', background: AppColors.white24Color),
      Spacer(),
      tag("⭐ $ratingValue", background: AppColors.white24Color),
    ],
  );
}