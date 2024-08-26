import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoLogic extends GetxController {
  var isLoading = true.obs;
  var isLoad = true.obs;
  var isPlaying = false.obs;
  var progress = 0.0.obs;
  late VideoPlayerController controller;


  void stopOrPlay() {
    if (isPlaying.value) {
      controller.pause();
    } else {
      controller.play();
    }
    isPlaying.value = !isPlaying.value;
  }

  void loadUrl(String url) {
    controller = VideoPlayerController.networkUrl(
        Uri.parse(url));
    controller.initialize().then((_) {
      if (controller.value.isInitialized) {
        isLoading.value = false;
        controller.play();
        isPlaying.value = true;
      } else {
        isLoad.value = true;
      }
    }).catchError((e) {
      isLoad.value = false;
      print("Video initialization error: $e");
    });

    controller.addListener(() {
      progress.value = controller.value.position.inSeconds /
          controller.value.duration.inSeconds;
    });
  }
}
