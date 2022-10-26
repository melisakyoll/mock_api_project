import 'package:bktomarrow/view/home.dart';
import 'package:flutter/material.dart';

import 'request_users/view/users_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: UserView(),
    );
  }
}
