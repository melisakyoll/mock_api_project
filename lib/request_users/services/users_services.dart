// ignore_for_file: avoid_web_libraries_in_flutter, use_build_context_synchronously

import 'package:bktomarrow/request_users/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class IClientServices {
  final Dio dio;
  late BuildContext dialogContext;

  IClientServices(this.dio);

  Future<List<Users>?> fetchUsersItem();
}

class ClientServices extends IClientServices {
  ClientServices(super.dio);

  @override
  Future<List<Users>?> fetchUsersItem() async {
    const String url = 'https://6357dbe8c26aac906f345c6b.mockapi.io/users';
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final jsonBody = response.data;
      if (jsonBody is List) {
        return jsonBody.map((json) => Users.fromJson(json)).toList();
      }
    }
    return null;
  }

  Future<void> updateUser(title, userId) async {
    String url = 'https://6357dbe8c26aac906f345c6b.mockapi.io/users';

    final data = {
      "title": title,
    };

    try {
      final response = await dio.patch(url, data: data);
      Navigator.pop(dialogContext);
      //buildShowSnackBar(context, 'msg');
      debugPrint('User : ${response.data}');
    } catch (e) {
      debugPrint('exception $e');
    }
  }

  Future<void> deleteUser(userId) async {
    String url = 'https://6357dbe8c26aac906f345c6b.mockapi.io/users';
    try {
      final response = await dio.delete(url);
      Navigator.pop(dialogContext);
      debugPrint('User : ${response.data}');
      debugPrint('message : ${response.statusMessage}');
    } catch (e) {
      debugPrint('exception $e');
    }
  }
}
