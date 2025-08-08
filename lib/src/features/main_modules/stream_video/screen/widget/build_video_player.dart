import 'package:ifarmer/src/app_config/imports/import.dart';

Widget buildPlayer({
  required StreamVideoController controller
}) {
  return Expanded(
    child: Center(
      child: AspectRatio(
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
      ),
    ),
  );
}