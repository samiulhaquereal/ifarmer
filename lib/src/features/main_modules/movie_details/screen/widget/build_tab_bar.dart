import 'package:ifarmer/src/app_config/imports/import.dart';

Widget buildTabBar(MovieDetailsModel? movie) {
  return DefaultTabController(
    length: 3,
    child: Column(
      children: [
        TabBar(
          labelColor: AppColors.orangeColor,
          unselectedLabelColor: AppColors.white60Color,
          indicatorColor: AppColors.orangeColor,
          labelStyle: TextStyle(fontSize: 14.sp),
          tabs: [
            Tab(text: AppStrings.cast),
            Tab(text: AppStrings.details),
          ],
        ),
        SizedBox(
          height: 200.h,
          child: TabBarView(
            children: [
              buildCastTab(movie),
              buildDetailsTab(movie),
            ],
          ),
        ),
      ],
    ),
  );
}