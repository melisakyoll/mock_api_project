import 'package:bktomarrow/core/extension/extension.dart';
import 'package:bktomarrow/core/utils/strings.dart';
import 'package:bktomarrow/product/service/project_network.dart';
import 'package:bktomarrow/request_users/services/users_services.dart';
import 'package:bktomarrow/request_users/view/details/user_details_page.dart';
import 'package:bktomarrow/request_users/view_model/provider_user_request.dart';
import 'package:bktomarrow/request_users/view_model/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/color_constant.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

//class _UserViewState extends UsersViewModel
class _UserViewState extends UsersViewModel with ProjectDioMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
      create: (BuildContext context) =>
          UserProvider(ClientServices(dioUrlService)),
      builder: ((context, child) {
        return Scaffold(
            backgroundColor: ColorConstant.lightBackground,
            appBar: _appBar(),
            body: ListView.builder(
                itemCount: context
                    .watch<UserProvider>()
                    .usersList
                    .length, //usersList.length,
                itemBuilder: ((context, index) {
                  return _customCard(index, context);
                })));
      }),
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

  ListTile _customListTile(
    int index,
    BuildContext context,
  ) {
    return ListTile(
      leading: ClipOval(
        child: SizedBox.fromSize(
          size: const Size.fromRadius(25),
          child: Image.network(
            context.watch<UserProvider>().usersList[index].avatar!,
            //usersList[index].avatar!,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Row(
        children: [
          Text(context.watch<UserProvider>().usersList[index].name ??
              TextWidget.noData),
          sizedBox(context),
          Text(context.watch<UserProvider>().usersList[index].surname ??
              TextWidget.noData),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.watch<UserProvider>().usersList[index].phone ??
              TextWidget.noData),
          Text(context.watch<UserProvider>().usersList[index].email ??
              TextWidget.noData),
        ],
      ),
      trailing: _detailsButton(context, index),
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
