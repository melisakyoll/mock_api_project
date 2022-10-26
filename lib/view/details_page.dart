// ignore_for_file: must_be_immutable, unused_element

import 'package:bktomarrow/core/extension/extension.dart';
import 'package:bktomarrow/core/utils/strings.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final List users;
  int index;
  DetailsPage({super.key, required this.users, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextWidget.detailsName),
      ),
      body: Center(
        child: Padding(
          padding: context.horizontalAndVerticalLow,
          child: ListView(
            children: [
              Image.network(
                users[index].avatar!,
                fit: BoxFit.fitWidth,
              ),
              _sizedBox(context),
              _nameAndSurname(),
              _mailAndPhone(context),
              Text(TextWidget.loremText * 25),
            ],
          ),
        ),
      ),
    );
  }

  Column _mailAndPhone(BuildContext context) {
    return Column(
      children: [
        _sizedBox(context),
        Text(users[index].email!),
        _sizedBox(context),
        Text(users[index].phone!),
        _sizedBox(context),
      ],
    );
  }

  Row _nameAndSurname() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(users[index].name!),
        const SizedBox(width: 5),
        Text(users[index].surname!),
      ],
    );
  }
}

SizedBox _sizedBox(BuildContext context) => SizedBox(height: context.lowValue);
