import 'package:bktomarrow/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

import 'request_users/view/home/users_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: ColorConstant.blackColor)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const UserView(),
    );
  }
}
