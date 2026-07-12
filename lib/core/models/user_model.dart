class UserModel {
  String? token;
  UserModel({required this.token});
  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }
}