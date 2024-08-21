/// 限制输入类型
enum FormColumnEnum {
  text,
  number,
  float,
  password,
  email,
  date,
  time,
  datetime,
  chinese;

  static Map<FormColumnEnum, String> rule = {
    FormColumnEnum.number: "[0-9]",
    FormColumnEnum.float: "[0-9.]",
  };
}