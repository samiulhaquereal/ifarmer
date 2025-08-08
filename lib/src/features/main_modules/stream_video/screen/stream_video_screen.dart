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
        return AspectRatio(
          aspectRatio: controller.controller.value.aspectRatio,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              VideoPlayer(controller.controller),
              VideoProgressIndicator(controller.controller,
                  allowScrubbing: true),
              Positioned(
                right: 16.w,
                bottom: 16.h,
                child: IconButton(
                  icon: Icon(
                    controller.controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    color: AppColors.whiteColor,
                  ),
                  onPressed: ()=> controller.onTapPlayPause() ,
                ),
              )
            ],
          ),
        );
      }),
    );
  }

}
