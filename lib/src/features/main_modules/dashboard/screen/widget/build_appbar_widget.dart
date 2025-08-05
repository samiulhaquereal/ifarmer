import 'package:ifarmer/src/app_config/imports/import.dart';

AppBar buildAppBar({
  required DashboardController controller
}) {
  return AppBar(
    backgroundColor: AppColors.backgroundColor,
    elevation: AppSizes.elevationZero,
    centerTitle: true,
    leadingWidth: 90.w,
    leading: RetCoreDropdownField(
      borderColor: AppColors.orangeColor,
      itemFontColor: AppColors.whiteColor,
      itemList: AppValues.dropList,
      retCoreDropdownFieldStyle: RetCoreDropdownFieldStyle.normal,
      selectedItem: controller.selectedItem,
      fieldFocusNode: controller.fieldFocusNode,
      labelColor: AppColors.orangeColor,
      focusedColor: AppColors.orangeColor,
      backgroundColor: AppColors.backgroundColor,
      dropIconColor: AppColors.orangeColor,
    ),
    title: Image.network(AppValues.logo, height: 40.h),
    actions: [
      Icon(Icons.grid_view, color: AppColors.whiteColor),
      RetCore.space(15.w)
    ],
  );
}