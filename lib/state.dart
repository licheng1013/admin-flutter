import 'package:admin_flutter/component/messages.dart';
import 'package:admin_flutter/theme/light_theme.dart';
import 'package:get/get.dart';

/// 全局状态
/// 默认主题
var theme = Light3().theme();

/// 多语言
var message = Messages();

/// 全局刷新解决主题色没有同时更新问题
var appReload = false.obs;

/// 启用水印
var waterMark = false.obs;

/// 侧边栏展开
var sidebarExpanded = true.obs;

/// 侧边栏显示
var sidebarShow = true.obs;
