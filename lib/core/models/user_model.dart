class UserModel {
  String? accessToken;
  String? refreshToken;

  UserModel({
    this.accessToken,
    this.refreshToken,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }
}