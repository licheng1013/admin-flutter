class User {
  int id;
  String userName;
  String password;
  String salt;
  String nickName;
  String createTime;

  User({
    required this.id,
    required this.userName,
    required this.password,
    required this.salt,
    required this.nickName,
    required this.createTime,
  });

  // 序列化和反序列化
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userName": userName,
      "password": password,
      "salt": salt,
      "nickName": nickName,
      "createTime": createTime
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["id"] ?? 0,
        userName: json["userName"],
        password: json["password"],
        salt: json["salt"],
        nickName: json["nickName"],
        createTime: json["createTime"] ?? "");
  }


}
