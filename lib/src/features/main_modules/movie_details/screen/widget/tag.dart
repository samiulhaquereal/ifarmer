import 'package:ifarmer/src/app_config/imports/import.dart';

Widget tag(String text, {Color background = AppColors.orangeColor}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
    decoration: BoxDecoration(
      color: background,
      borderRadius: BorderRadius.circular(4.r),
    ),
    child: Text(text,
        style: TextStyle(
            color: AppColors.whiteColor, fontSize: 10.sp, fontWeight: FontWeight.bold)),
  );
}