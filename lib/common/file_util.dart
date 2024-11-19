import 'package:file_selector/file_selector.dart';

/// 文件工具
class FileUtil {
  static XTypeGroup image() {
    return const XTypeGroup(
      label: 'Images',
      extensions: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp', 'heif'],
    );
  }

  static XTypeGroup pdf() {
    return const XTypeGroup(
      label: 'Pdf',
      extensions: ['pdf'],
    );
  }

  /// 选择单个文件
  static Future<XFile?> selectFile({XTypeGroup? type}) async {
    var types = <XTypeGroup>[];
    if (type != null) {
      types.add(type);
    }
    return await openFile(acceptedTypeGroups: types);
  }

  /// 选择多个文件
  static Future<List<XFile>> selectManyFile({XTypeGroup? type}) async {
    var types = <XTypeGroup>[];
    if (type != null) {
      types.add(type);
    }
    return await openFiles(acceptedTypeGroups: types);
  }
}

/// 扩展类型
extension ExXTypeGroup on XTypeGroup {
  Future<XFile?> selectFile() async {
    return await FileUtil.selectFile(type: this);
  }

  Future<List<XFile>> selectManyFile() async {
    return await FileUtil.selectManyFile(type: this);
  }
}