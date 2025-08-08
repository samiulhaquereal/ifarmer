import 'package:ifarmer/src/app_config/imports/import.dart';

Widget buildHeaderImage(String? url) {
  return Stack(
    children: [
      Container(
        width: Get.width.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: AspectRatio(
          aspectRatio: 3 / 4,
          child: url != null && url != AppStrings.na
              ? Image.network(url, fit: BoxFit.fitWidth)
              : Container(color: AppColors.customGrayColor),
        ),
      ),
      Positioned(
        top: 10.h,
        left: 10.w,
        child: BackButton(color: AppColors.whiteColor),
      ),
    ],
  );
}