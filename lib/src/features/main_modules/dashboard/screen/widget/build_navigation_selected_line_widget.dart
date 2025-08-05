import 'package:ifarmer/src/app_config/imports/import.dart';

Widget buildNavigationSelectedLine({
  required DashboardController controller
}) {
  return Obx(() => Positioned(
    left: controller.myIndex.value * Get.width.w / 3.w,
    bottom: 0.h,
    child: Container(
      width: Get.width.w / 3.w,
      height: AppSizes.navigationSelectedLineHeight.h,
      color: AppColors.orangeColor,
    ),
  ));
}