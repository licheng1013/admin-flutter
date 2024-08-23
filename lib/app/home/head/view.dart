import 'package:admin_flutter/app/home/sidebar/logic.dart';
import 'package:admin_flutter/ex/ex_anim.dart';
import 'package:admin_flutter/ex/ex_list.dart';
import 'package:admin_flutter/state.dart';
import 'package:admin_flutter/theme/theme_util.dart';
import 'package:admin_flutter/theme/ui_theme.dart';
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
              ThemeUtil.width(),
              InkWell(
                  onTap: () {
                    sidebarExpanded.value = !sidebarExpanded.value;
                    sidebarShow.value = false;
                  },
                  child: const Icon(Icons.menu)),
              ThemeUtil.width(),
              _breadcrumb(),
              const Spacer(),
              InkWell(
                borderRadius: BorderRadius.circular(32),
                onTap: () {
                  logic.clickHeadImage();
                },
                child: ClipOval(
                  // 圆形头像
                    child: Image.asset("assets/images/cat.jpeg",height: 42,width: 42,)),
              ),
              ThemeUtil.width(),
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
      ).toFadeInWithMoveX(SidebarLogic.breadcrumbList.isNotEmpty);
    });
  }
}
