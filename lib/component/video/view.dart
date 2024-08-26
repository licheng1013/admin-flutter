import 'package:admin_flutter/theme/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'logic.dart';

class VideoPage extends StatelessWidget {
  VideoPage(String url, {super.key}){
    logic.loadUrl(url);
  }
  final logic = Get.put(VideoLogic());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (logic.isLoading.value) {
        return const Center(
            child: Text(
          "加载中...",
          style: TextStyle(fontSize: 28),
        ));
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
        VideoPlayer(logic.controller),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    logic.stopOrPlay();
                  },
                  icon: logic.isPlaying.value
                      ? const Icon(Icons.pause)
                      : const Icon(Icons.play_arrow)),
              Expanded(child: UiTheme.progress(value: logic.progress.value)),
              Text("${logic.progress.value * 100 ~/ 1}%"),
            ],
          ),
        )
      ],
    );
  }
}
