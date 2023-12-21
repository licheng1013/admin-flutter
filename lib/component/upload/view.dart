import 'package:app_template/common/assets_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class UploadPage extends StatelessWidget {
  UploadPage({Key? key}) : super(key: key);

  final logic = Get.put(UploadLogic());
  final state = Get.find<UploadLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GridView.builder(
          // 不允许
          shrinkWrap: true,
          itemCount: logic.imageList.length + 1,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, mainAxisSpacing: 4, crossAxisSpacing: 4),
          itemBuilder: (context, index) {
            if (index == logic.imageList.length) {
              return _addItem();
            }
            return _imageItem(index);
          });
    });
  }

  Widget _imageItem(int index) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            AssetsUtil.showImage(logic.imageList[index]);
          },
          child: Container(
              height: double.infinity,
              // 黑色边框
              decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(6)),
              child: AssetsUtil.imageByPath(
                logic.imageList[index],
                fit: BoxFit.fill,
              )),
        ),
        Center(
            child: IconButton(
                onPressed: () {
                  logic.imageList.removeAt(index);
                },
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.white,
                )))
      ],
    );
  }

  Widget _addItem() {
    return Container(
      // 黑色边框
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(6)),
      child: Center(
          child: IconButton(
              onPressed: () {
                logic.selectFile();
              },
              icon: const Icon(
                Icons.add_outlined,
                color: Colors.grey,
              ))),
    );
  }
}
