import 'package:ifarmer/src/app_config/imports/import.dart';

class StreamVideoScreen extends BaseView<StreamVideoController> {
  StreamVideoScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Obx(() {
        if (!controller.isInitialized.value) {
          return const CircularProgressIndicator(color: AppColors.orangeColor);
        }
        return Column(
          mainAxisAlignment: centerMAA,
          crossAxisAlignment: startCAA,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.w, top: 8.h),
              child: BackButton(
                color: AppColors.whiteColor,
              ),
            ),
            buildPlayer(controller: controller),
          ],
        );
      }),
    );
  }
}