// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:bktomarrow/request_users/model/user_model.dart';
import 'package:dio/dio.dart';

abstract class IClientServices {
  final Dio dio;

  IClientServices(this.dio);

  Future<List<Users>?> fetchUsersItem();
}

class ClientServices extends IClientServices {
  ClientServices(super.dio);

  @override
  Future<List<Users>?> fetchUsersItem() async {
    String url = 'https://6357dbe8c26aac906f345c6b.mockapi.io/users';
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final jsonBody = response.data;
      if (jsonBody is List) {
        return jsonBody.map((json) => Users.fromJson(json)).toList();
      }
    }
    return null;
  }
}
