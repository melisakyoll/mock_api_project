import 'package:bktomarrow/core/utils/strings.dart';
import 'package:bktomarrow/view/details_page.dart';
import 'package:flutter/material.dart';

import '../request_users/model/user_model.dart';
import '../request_users/services/api_aervices.dart';

class CustomFutueBuilder extends StatelessWidget {
  const CustomFutueBuilder({
    Key? key,
    required this.userServices,
  }) : super(key: key);

  final UserServices userServices;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: userServices.getUser(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          List<Users> users = snapshot.data;
          return _customListView(users);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  ListView _customListView(List<Users> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: ((context, index) => SizedBox(
            height: 90,
            child: Card(
              child: Column(
                children: [
                  _listTile(users, index, context),
                ],
              ),
            ),
          )),
    );
  }

  ListTile _listTile(List<Users> users, int index, BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          child: Image.network(users[index].avatar!),
        ),
        title: _nameAndSurname(users, index),
        subtitle: _mailAndPhone(users, index),
        trailing: OutlinedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => DetailsPage(
                          users: users,
                          index: index,
                        ))));
          },
          style: OutlinedButton.styleFrom(
            shape: const StadiumBorder(),
          ),
          child: Text(TextWidget.detailsName),
        ));
  }

  Column _mailAndPhone(List<Users> users, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(users[index].email!),
        //const SizedBox(height: 5),
        Text(users[index].phone!),
      ],
    );
  }

  Row _nameAndSurname(List<Users> users, int index) {
    return Row(
      children: [
        Text(users[index].name!),
        const SizedBox(width: 5),
        Text(users[index].surname!),
      ],
    );
  }
}
