// ignore_for_file: avoid_web_libraries_in_flutter, use_build_context_synchronously, prefer_interpolation_to_compose_strings, avoid_print, unused_local_variable

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
  String url = 'https://6357dbe8c26aac906f345c6b.mockapi.io/users';
  ClientServices(super.dio);

  @override
  Future<List<Users>?> fetchUsersItem() async {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final jsonBody = response.data;
      if (jsonBody is List) {
        return jsonBody.map((json) => Users.fromJson(json)).toList();
      }
    }
    return null;
  }

  Future<void> deleteUser(id) async {
    try {
      await dio.delete(url + '/$id');
      //Navigator.pop(dialogContext);
      print('Delete');
    } catch (e) {
      print('Error deleting user: $e');
    }
  }

  Future<Users> updateUser(String id, Users users) async {
    Users? updatedUser;
    try {
      Response response = await dio.put(url + '/$id', data: users.toJson());
      print('User updated: ${response.data}');
      updatedUser = Users.fromJson(response.data);
    } catch (e) {
      print('Error updating user: $e');
    }
    return updatedUser!;
  }
}
