import 'package:ifarmer/src/app_config/imports/import.dart';

class MovieDetailsScreen extends BaseView<MovieDetailsController> {
  MovieDetailsScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(()=>Column(
          children: [
            buildHeaderImage(controller.movieDetails.value?.poster),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
              child: Column(
                crossAxisAlignment: startCAA,
                children: [
                  buildTags(controller.movieDetails.value),
                  RetCore.space(8.h),
                  Text(controller.movieDetails.value?.title ?? '',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold, color: AppColors.whiteColor)),
                  RetCore.space(4.h),
                  Text(
                    '${controller.movieDetails.value?.year ?? ''} • ${controller.movieDetails.value?.genre ?? ''}',
                    style: TextStyle(color: AppColors.white70Color,fontSize: 12.sp),
                  ),
                  RetCore.space(12.h),
                  Text(
                    controller.movieDetails.value?.plot ?? '',
                    style: TextStyle(color: AppColors.whiteColor, fontSize: 14.sp),
                  ),
                  RetCore.space(16.h),
                  Row(
                    children: [
                      buildButton(AppStrings.play, icon: Icons.play_arrow,onPressed: ()=> controller.onTapPlay(link: controller.videoLink)),
                      RetCore.space(12.w),
                      buildButton(AppStrings.subscribe,
                          backgroundColor: AppColors.orangeColor,onPressed: (){}),
                      RetCore.space(12.w),
                      IconButton(
                        icon: Icon(Icons.share, color: AppColors.white70Color,size: 22.sp,),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  RetCore.space(24.h),
                  buildTabBar(controller.movieDetails.value),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
