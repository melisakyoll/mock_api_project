import 'package:bktomarrow/core/extension/extension.dart';
import 'package:bktomarrow/core/utils/strings.dart';
import 'package:bktomarrow/request_users/view/details/user_details_page.dart';
import 'package:bktomarrow/request_users/view_model/users_view_model.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color_constant.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends UsersViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.lightBackground,
      appBar: _appBar(),
      body: ListView.builder(
        itemCount: usersList.length,
        itemBuilder: ((context, index) {
          return _customCard(index, context);
        }),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        TextWidget.usersText,
        style: context.textTheme.headline6
            ?.copyWith(color: ColorConstant.blackColor),
      ),
      elevation: 0,
      backgroundColor: ColorConstant.lightBackground,
    );
  }

  SizedBox _customCard(int index, BuildContext context) {
    return SizedBox(
      height: 120,
      child: Padding(
        padding: context.horizontalAndVerticalLow,
        child: Card(
          elevation: 1.3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _customListTile(index, context),
            ],
          ),
        ),
      ),
    );
  }

  ListTile _customListTile(int index, BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Image.network(usersList[index].avatar!),
      ),
      title: _nameSurname(index),
      subtitle: _mailPhone(index),
      trailing: _detailsButton(context, index),
    );
  }

  Row _nameSurname(int index) {
    return Row(
      children: [
        Text(usersList[index].name ?? ''),
        sizedBox(context),
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
                builder: ((context) =>
                    UserDetailPage(index: index, usersList: usersList))));
      },
      child: Text(TextWidget.detailsName),
    );
  }
}

SizedBox sizedBox(BuildContext context) => SizedBox(width: context.lowValue);


/*


UserDetailsPage(
                      index: index,
                      usersList: usersList,
                    )
 */