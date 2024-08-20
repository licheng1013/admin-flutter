import 'dart:developer';

import 'package:app_template/app/launch/view.dart';
import 'package:app_template/common/app_data.dart';
import 'package:app_template/component/messages.dart';
import 'package:app_template/theme/dark_theme.dart';
import 'package:app_template/theme/my_theme.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'theme/light_theme.dart';

/// 默认主题
var theme = Light().theme();
/// 多语言
var message = Messages();
/// 全局刷新解决主题色没有同时更新问题
var appReload = false.obs;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appData = await AppData.read();
  var findTheme = themeList.firstWhereOrNull((e)=>e.name() == appData.themeName);
  theme = findTheme?.theme() ?? Light().theme();
  await message.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return GetMaterialApp(
        translations: message,
        defaultTransition: Transition.noTransition,
        builder: BotToastInit(),
        //1.调用BotToastInit
        navigatorObservers: [BotToastNavigatorObserver()],
        //2.注册路由观察者
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English
          Locale('zh'), // Chinese
        ],
        locale: const Locale('zh'),
        theme: theme,
        home: LaunchPage(),
      );
  }
}
