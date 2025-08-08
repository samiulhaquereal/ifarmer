import 'package:ifarmer/src/app_config/imports/import.dart';

Widget buildDetailsTab(MovieDetailsModel? movie) {
  return Padding(
    padding: EdgeInsets.only(top: 12.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        detailRow(AppStrings.director, movie?.director),
        detailRow(AppStrings.studio, movie?.production),
        detailRow(AppStrings.released, movie?.released),
        detailRow(AppStrings.genre, movie?.genre),
        detailRow(AppStrings.language, movie?.language),
      ],
    ),
  );
}