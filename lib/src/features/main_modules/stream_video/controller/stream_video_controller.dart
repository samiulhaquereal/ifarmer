import 'package:ifarmer/src/app_config/imports/import.dart';

class StreamVideoController extends BaseController{

  late VideoPlayerController controller;
  var isInitialized = false.obs;
  Duration? savedPosition;

  @override
  void onInit() {
    super.onInit();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    String url = Get.arguments;
    final savedMillis = await StorageManager().getVideoLastPosition();
    savedPosition = savedMillis != null ? Duration(milliseconds: savedMillis) : null;

    controller = VideoPlayerController.networkUrl(Uri.parse(url))
      ..setLooping(true)
      ..initialize().then((_) {
        isInitialized.value = true;
        if (savedPosition != null) {
          controller.seekTo(savedPosition!);
        }
        controller.play();
      });
  }

  Future<void> saveVideoPosition() async {
    if (controller.value.isInitialized) {
      final position = controller.value.position;
      await StorageManager().setVideoLastPosition(videoLastPosition: position.inMilliseconds);
    }
  }

  void onTapPlayPause(){
    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      controller.play();
    }
  }

  @override
  void onClose() {
    saveVideoPosition();
    controller.dispose();
    super.onClose();
  }

}
