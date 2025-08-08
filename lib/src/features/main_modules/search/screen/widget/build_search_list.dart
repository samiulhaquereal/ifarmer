import 'package:ifarmer/src/app_config/imports/import.dart';

Widget buildSearchList({
  required SearchItemController controller
}) {
  return Expanded(
    child: Obx(() {
      final data = controller.searchResult.value;

      if (data == null || data.search == null || data.search!.isEmpty) {
        return Center(child: Text(AppStrings.noResult, style: TextStyle(color: AppColors.whiteColor)));
      }
      return GridView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 12.w),
        itemCount: data.search!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.h,
          crossAxisSpacing: 12.w,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) {
          final movie = data.search![index];
          return buildSearchItem(movie: movie, controller: controller);
        },
      )
      ;
    }),
  );
}