// ignore_for_file: must_be_immutable, unused_element

import 'package:bktomarrow/core/extension/extension.dart';
import 'package:flutter/material.dart';

import '../../../components/users_details_component.dart';
import '../../../core/utils/strings.dart';
import '../../model/user_model.dart';

class UserDetailsPage extends StatelessWidget {
  List<Users> usersList = [];
  int index;
  UserDetailsPage({super.key, required this.usersList, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: context.horizontalAndVerticalLow,
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

SizedBox sizedBox(BuildContext context) => SizedBox(height: context.lowValue);
