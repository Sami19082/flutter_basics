import '../Db.dart';

class UserModel {
  int user_id;
  String user_name;
  String user_email;
  String user_password;

  UserModel(
      {required this.user_id,
      required this.user_name,
      required this.user_email,
      required this.user_password});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        user_id: map[AppDataBase.USER_ID],
        user_name: map[AppDataBase.USER_NAME],
        user_email: map[AppDataBase.USER_EMAIL],
        user_password: map[AppDataBase.USER_PASSWORD]);
  }

  Map<String, dynamic> toMap() {
    return {
      AppDataBase.USER_NAME: user_name,
      AppDataBase.USER_EMAIL: user_email,
      AppDataBase.USER_PASSWORD: user_password
    };
  }
}
