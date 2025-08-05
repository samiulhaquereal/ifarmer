import 'dart:ui';
import 'package:ifarmer/src/app_config/imports/import.dart';

Widget buildNavigationBar({
  required DashboardController controller
}) {
  return Stack(
    children: [
      ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: AppSizes.navigationBarBlur, sigmaY: AppSizes.navigationBarBlur),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.transparentColor,
              border: Border.all(
                width: AppSizes.navigationBarBorderWidth.w,
                color: AppColors.grayColor.withOpacity(0.5),
              ),
            ),
            child: Obx(() => BottomNavigationBar(
              backgroundColor: AppColors.transparentColor,
              elevation: AppSizes.elevationZero,
              selectedItemColor: AppColors.orangeColor,
              unselectedItemColor: AppColors.customeGrayColor,
              currentIndex: controller.myIndex.value,
              onTap: (index) => controller.onTapNavigationBar(index),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: AppSizes.navigationBarIcon.sp,color: controller.myIndex.value == 0 ? AppColors.orangeColor : AppColors.customeGrayColor),
                  label: AppStrings.home,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search, size: AppSizes.navigationBarIcon.sp,color: controller.myIndex.value == 1 ? AppColors.orangeColor : AppColors.customeGrayColor),
                  label: AppStrings.search,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu, size: AppSizes.navigationBarIcon.sp,color: controller.myIndex.value == 2 ? AppColors.orangeColor : AppColors.customeGrayColor),
                  label: AppStrings.menu,
                ),
              ],
            ),
            ),
          ),
        ),
      ),
      buildNavigationSelectedLine(controller: controller),
    ],
  );
}