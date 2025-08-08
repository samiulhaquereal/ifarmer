import 'package:ifarmer/src/app_config/imports/import.dart';

Widget buildSearchBar({
  required SearchItemController controller
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 12.w),
    child: Container(
      height: 42.h,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          Icon(Icons.search, color: AppColors.white70Color, size: 20.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              onChanged: (value) => controller.onSearchTextChanged(value),
              style: TextStyle(color: AppColors.whiteColor),
              decoration: InputDecoration(
                hintText: 'Search Title, Movie or Cast',
                hintStyle: TextStyle(color: AppColors.white54Color,fontSize: 14.sp),
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    ),
  );
}