import 'package:app_template/app/home/pages/user/view.dart';
import 'package:app_template/app/home/sidebar/logic.dart';
import 'package:app_template/app/home/sidebar/view.dart';
import 'package:app_template/app/home/tab_bar/logic.dart';
import 'package:app_template/app/home/tab_bar/view.dart';
import 'package:app_template/common/assets_util.dart';
import 'package:app_template/common/message_util.dart';
import 'package:app_template/common/url_util.dart';
import 'package:app_template/ex/ex_anim.dart';
import 'package:app_template/ex/ex_list.dart';
import 'package:app_template/theme/theme_util.dart';
import 'package:app_template/theme/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HeadPage extends StatelessWidget {
  HeadPage({Key? key}) : super(key: key);

  final logic = Get.put(HeadLogic());

  @override
  Widget build(BuildContext context) {
    return _head();
  }

  Widget _head() {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Row(
            children: [
              ThemeUtil.rowWidth(),
              InkWell(
                  onTap: () {
                    SidebarLogic.isExpanded.value =
                    !SidebarLogic.isExpanded.value;
                    SidebarLogic.isExpandedAnim.value = false;
                  },
                  child: const Icon(Icons.menu)),
              ThemeUtil.rowWidth(),
              _breadcrumb(),
              const Spacer(),
              FilledButton(
                  onPressed: () {
                    UrlUtil.openUrl("https://flutterweb-wasm.web.app/");
                  },
                  child: const Text("Wasm")),
              ThemeUtil.rowWidth(),
              FilledButton(
                  onPressed: () {
                    UrlUtil.openUrl(
                        "https://github.com/licheng1013/admin-flutter");
                  },
                  child: const Text("Star")),
              ThemeUtil.rowWidth(),
              InkWell(
                borderRadius: BorderRadius.circular(18),
                onTap: () {
                  logic.clickHeadImage();
                },
                child: const ClipOval(
                  // 圆形头像
                    child: FlutterLogo(
                      size: 36,
                    )),
              ),
              ThemeUtil.rowWidth(),
            ],
          ),
        ),
        ThemeUtil.lineH(),
      ],
    );
  }

  /// 面包屑组件
  Widget _breadcrumb() {
    return Obx(() {
      return Row(
        children: SidebarLogic.breadcrumbList.toWidgetsWithIndex((e, index) {
          var isLast = index != SidebarLogic.breadcrumbList.length - 1;
          var color = UiTheme.getTextColor(!isLast);
          return Row(
            children: [
              Icon(
                e.icon,
                size: 16,
                color: color,
              ),
              Text(e.name,style: TextStyle(color:color),),
              const SizedBox(
                width: 6,
              ),
              Visibility(
                  visible: isLast,
                  child:  Icon(Icons.arrow_forward_ios,size: 12,color: color,)),
              const SizedBox(
                width: 6,
              ),
            ],
          );
        }),
      );
    });
  }
}
