// ignore_for_file: file_names
/*
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class UserServices {
  String url = 'https://6357dbe8c26aac906f345c6b.mockapi.io/users';

  Future<List<Users>> fetchData() async {
    Uri uri = Uri.parse(url);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      UserData userData = UserData.fromJson(result);
      return userData.users;
    } else {
      throw Exception('Failed to load DemoAPI');
    }
  }
}

class UserServices {
  // ignore: prefer_typing_uninitialized_variables
  Future<List<Users>> getUser() async {
    String url = 'https://6357dbe8c26aac906f345c6b.mockapi.io/users';
    Uri uri = Uri.parse(url);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      List result = json.decode(response.body);

      // data = result.map((e) => Article.fromJson(Map.from(e))).toList();
      //UserData news = UserData.fromJson(result);
      /*for (news in result) {
        newsDetails.add(News.fromJson(result));
      }*/
      return result.map((e) => Users.fromJson(e)).toList();
    }
    throw Exception('Article not working');
  }
}
*/
/*

;

 */