import 'package:flutter/cupertino.dart';

import '../model/user_model.dart';
import '../services/users_services.dart';

class UserProvider extends ChangeNotifier {
  final IClientServices clientServices;
  List<Users> usersList = [];
  bool isLoading = false;
  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  UserProvider(this.clientServices) {
    fetch();
  }

  Future<void> fetch() async {
    _changeLoading();
    usersList = await clientServices.fetchUsersItem() ?? [];
    _changeLoading();
  }
}
