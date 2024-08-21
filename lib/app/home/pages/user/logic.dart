import 'package:app_template/component/form/enum.dart';
import 'package:app_template/component/form/form_data.dart';
import 'package:get/get.dart';

class UserLogic extends GetxController {
  var list = <Map<String, dynamic>>[].obs;
  var total = 200;

  Map<String, dynamic> _data(int i) {
    return {
      "name": "张三$i",
      "age": "张三$i",
      "sex": "张三$i",
      "tel": "张三$i",
    };
  }

  void find(size, page) {
    list.clear();
    if (page * size > total) {
      // TODO 这里暂时还有个问题， 当前页的数据不足一页时，会出现空白
      return;
    }
    for (int i = (page - 1) * size; i < page * size; i++) {
      list.add(_data(i));
    }
    list.refresh();
  }

  var form = FormDto(labelWidth: 80, columns: [
    FormColumnDto(label: "账号", key: "username", placeholder: "请输入账号"),
    FormColumnDto(
        placeholder: "请输入密码",
        label: "密码",
        key: "password",
        type: FormColumnEnum.password),
    FormColumnDto(
        placeholder: "请输入手机号",
        label: "手机号",
        key: "tel",
        type: FormColumnEnum.number,
        maxLength: 11),
    FormColumnDto(label: "地址", key: "address", placeholder: "请输入地址"),
    FormColumnDto(
        label: "金币",
        key: "number",
        type: FormColumnEnum.float,
        placeholder: "请输入金币"),
    FormColumnDto(
        placeholder: "请选择时间",
        label: "创建时间",
        key: "createTime",
        type: FormColumnEnum.datetime),
  ]);
}
