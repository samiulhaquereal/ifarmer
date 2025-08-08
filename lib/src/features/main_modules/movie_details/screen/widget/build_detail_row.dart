import 'package:ifarmer/src/app_config/imports/import.dart';

Widget detailRow(String label, String? value) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.h),
    child: Row(
      children: [
        SizedBox(width: 100.w, child: Text(label, style: TextStyle(color: AppColors.white54Color,fontSize: 13.sp))),
        Expanded(
            child: Text(value ?? "-", style: TextStyle(color: AppColors.whiteColor,fontSize: 12.sp))),
      ],
    ),
  );
}
