import 'package:ifarmer/src/app_config/imports/import.dart';

Widget buildCastTab(MovieDetailsModel? movie) {
  return Padding(
    padding: EdgeInsets.only(top: 12.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        detailRow(AppStrings.cast, movie?.actors),
      ],
    ),
  );
}