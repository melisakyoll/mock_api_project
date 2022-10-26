import 'package:flutter/material.dart';

import '../request_users/model/user_model.dart';
import '../request_users/view/details/user_details.dart';

class DetailsComponent extends StatelessWidget {
  const DetailsComponent({
    Key? key,
    required this.usersList,
    required this.index,
  }) : super(key: key);

  final List<Users> usersList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(usersList[index].name ?? ''),
            const SizedBox(width: 5),
            Text(usersList[index].surname ?? ''),
          ],
        ),
        sizedBox(context),
        Column(
          children: [
            sizedBox(context),
            Text(usersList[index].email ?? ''),
            sizedBox(context),
            Text(usersList[index].phone ?? ''),
            sizedBox(context),
          ],
        ),
      ],
    );
  }
}
