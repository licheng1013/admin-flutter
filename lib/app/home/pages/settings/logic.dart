import 'package:app_template/theme/dark_theme.dart';
import 'package:app_template/theme/light_theme.dart';
import 'package:app_template/theme/my_theme.dart';
import 'package:get/get.dart';


class SettingsLogic extends GetxController {
  var themeList = <MyTheme>[
    Light(),
    Blue(),
  ];
}
