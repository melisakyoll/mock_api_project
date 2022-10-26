// ignore_for_file: prefer_void_to_null

import 'package:bktomarrow/request_users/model/user_model.dart';

class UserData {
  UserData({
    required this.status,
    required this.totalResults,
    required this.users,
  });

  Null status;
  Null totalResults;
  List<Users> users;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        status: json["status"],
        totalResults: json["totalResults"],
        users: json["users"] != null
            ? List<Users>.from(json["users"].map((x) => Users.fromJson(x)))
            : <Users>[],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}
