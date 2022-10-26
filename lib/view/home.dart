// ignore_for_file: library_private_types_in_public_api

import 'package:bktomarrow/core/utils/strings.dart';
import 'package:bktomarrow/request_users/model/user_model.dart';
import 'package:bktomarrow/request_users/services/api_aervices.dart';
import 'package:flutter/material.dart';

import '../components/custom_list_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserServices userServices = UserServices();
  Future<Users>? futureModel;
  final String? data = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextWidget.usersText),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: CustomFutueBuilder(userServices: userServices),
    );
  }
}
