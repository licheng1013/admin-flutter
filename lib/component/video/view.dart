import 'package:admin_flutter/theme/theme_util.dart';
import 'package:admin_flutter/theme/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'logic.dart';

class VideoPage extends StatelessWidget {
  VideoPage(String url, {super.key}) {
    logic.loadUrl(url);
  }

  final logic = Get.put(VideoLogic());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (logic.isLoading.value) {
        return Center(child: UiTheme.loading());
      }
      if (logic.isLoad.value) {
        return video();
      }
      return const Center(
        child: Text(
          "加载失败！",
          style: TextStyle(fontSize: 28),
        ),
      );
    });
  }

  Widget video() {
    return Stack(
      children: [
        Center(
          child: AspectRatio(
              aspectRatio: logic.controller.value.aspectRatio,
              child: VideoPlayer(logic.controller)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              ThemeUtil.width(),
              IconButton(
                  onPressed: () {
                    logic.stopOrPlay();
                  },
                  icon: logic.isPlaying.value
                      ? const Icon(Icons.pause)
                      : const Icon(Icons.play_arrow)),
              ThemeUtil.width(),
              Expanded(child: UiTheme.progress(value: logic.progress.value)),
              ThemeUtil.width(),
              Text("${logic.progress.value * 100 ~/ 1}%"),
              ThemeUtil.width()
            ],
          ),
        )
      ],
    );
  }
}
