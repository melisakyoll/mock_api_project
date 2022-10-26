import 'package:bktomarrow/request_users/view_model/users_view_model.dart';
import 'package:flutter/material.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends UsersViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: usersList.length,
        itemBuilder: ((context, index) {
          return Text(usersList[index].name ?? '');
        }),
      ),
    );
  }
}
