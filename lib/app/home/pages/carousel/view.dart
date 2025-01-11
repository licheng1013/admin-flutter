import 'package:admin_flutter/app/home/sidebar/logic.dart';
import 'package:admin_flutter/ex/ex_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class CarouselPage extends StatelessWidget {
  CarouselPage({Key? key}) : super(key: key);
  final logic = Get.put(CarouselLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 300,
        child: CarouselView(
            itemExtent: 500,
            children: [1, 2, 3, 4, 5].toWidgets((e) {
              return SizedBox(child: Center(child: Text("$e")));
            })),
      ),
    );
  }

  static SidebarTree newThis() {
    return SidebarTree(
      name: "轮播图",
      icon: Icons.home,
      page: CarouselPage(),
    );
  }
}
