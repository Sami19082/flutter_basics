import '../db/database.dart';

class GridUserModel {
  int g_userID;
  String g_user_name;
  String g_user_email;
  String g_user_password;

  GridUserModel({
    required this.g_userID,
    required this.g_user_name,
    required this.g_user_email,
    required this.g_user_password,
  });

  factory GridUserModel.fromMap(Map<String, dynamic> map) {
    return GridUserModel(
        g_userID: map[GAppDataBase.USER_ID],
        g_user_name: map[GAppDataBase.USER_NAME],
        g_user_email: map[GAppDataBase.USER_EMAIL],
        g_user_password: map[GAppDataBase.USER_PASSWORD]);
  }

  Map<String, dynamic> toMap() {
    return {
      GAppDataBase.USER_NAME: g_user_name,
      GAppDataBase.USER_EMAIL: g_user_email,
      GAppDataBase.USER_PASSWORD: g_user_password
    };
  }
}
