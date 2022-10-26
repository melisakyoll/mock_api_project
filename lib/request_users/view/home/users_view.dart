import 'package:bktomarrow/core/utils/strings.dart';
import 'package:bktomarrow/request_users/view/details/user_details.dart';
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
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Image.network(usersList[index].avatar!),
              ),
              title: _nameSurname(index),
              subtitle: _mailPhone(index),
              trailing: _detailsButton(context, index),
            ),
          );
        }),
      ),
    );
  }

  Row _nameSurname(int index) {
    return Row(
      children: [
        Text(usersList[index].name ?? ''),
        Text(usersList[index].surname ?? ''),
      ],
    );
  }

  Column _mailPhone(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(usersList[index].phone ?? ''),
        Text(usersList[index].email ?? ''),
      ],
    );
  }

  OutlinedButton _detailsButton(BuildContext context, int index) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => UserDetailsPage(
                      index: index,
                      usersList: usersList,
                    ))));
      },
      child: Text(TextWidget.detailsName),
    );
  }
}
