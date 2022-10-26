// ignore_for_file: must_be_immutable

import 'package:bktomarrow/core/constant/color_constant.dart';
import 'package:bktomarrow/core/extension/extension.dart';
import 'package:bktomarrow/core/utils/strings.dart';
import 'package:flutter/material.dart';

import '../../../components/users_details_component.dart';
import '../../model/user_model.dart';

class UserDetailPage extends StatelessWidget {
  List<Users> usersList = [];
  int index;
  UserDetailPage({super.key, required this.index, required this.usersList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.lightBackground,
      appBar: AppBar(
        backgroundColor: ColorConstant.lightBackground,
        elevation: 0,
      ),
      body: ListView(
        children: [
          _centerContent(context),
        ],
      ),
    );
  }

  Center _centerContent(BuildContext context) {
    return Center(
      child: Column(
        children: [
          _avatarWidget(),
          sizedBoxMedium(context),
          DetailsComponent(
            index: index,
            usersList: usersList,
          ),
          _loremText(context)
        ],
      ),
    );
  }

  ClipOval _avatarWidget() {
    return ClipOval(
      child: SizedBox.fromSize(
        size: const Size.fromRadius(100),
        child: Image.network(
          usersList[index].avatar!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Padding _loremText(BuildContext context) {
    return Padding(
      padding: context.paddingMedium,
      child: Text(TextWidget.loremText * 50),
    );
  }
}
