import 'package:app_template/theme/dark_theme.dart';
import 'package:app_template/theme/light_theme.dart';
import 'package:app_template/theme/my_theme.dart';
import 'package:get/get.dart';

import 'state.dart';

class SettingsLogic extends GetxController {
  final SettingsState state = SettingsState();
  var themeList = <MyTheme>[
    Pink(),
    Blue(),
  ];
}
