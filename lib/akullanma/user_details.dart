// ignore_for_file: must_be_immutable, unused_element

import 'package:bktomarrow/core/constant/color_constant.dart';
import 'package:bktomarrow/core/extension/extension.dart';
import 'package:flutter/material.dart';

import '../components/users_details_component.dart';
import '../core/utils/strings.dart';
import '../request_users/model/user_model.dart';

class UserDetailsPage extends StatelessWidget {
  List<Users> usersList = [];
  int index;
  UserDetailsPage({super.key, required this.usersList, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.lightBackground,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          TextWidget.detailsName,
          style: context.textTheme.headline6
              ?.copyWith(color: ColorConstant.blackColor),
        ),
        elevation: 0,
        backgroundColor: ColorConstant.lightBackground,
      ),
      body: Center(
        child: Padding(
          padding: context.paddingLowHorizontal,
          child: ListView(
            children: [
              Image.network(
                usersList[index].avatar!,
                fit: BoxFit.fitWidth,
              ),
              sizedBox(context),
              DetailsComponent(usersList: usersList, index: index),
              Text(TextWidget.loremText * 25),
            ],
          ),
        ),
      ),
    );
  }
}
