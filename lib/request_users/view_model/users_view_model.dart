import 'package:bktomarrow/product/loading_stf.dart';
import 'package:bktomarrow/product/service/project_network.dart';
import 'package:bktomarrow/request_users/model/user_model.dart';
import 'package:bktomarrow/request_users/services/users_services.dart';

import '../view/home/users_view.dart';

abstract class UsersViewModel extends LoadingStateful<UserView>
    with ProjectDioMixin {
  late final IClientServices clientServices;
  List<Users> usersList = [];
  @override
  void initState() {
    super.initState();
    clientServices = ClientServices(dioUrlService);
    fetch();
  }

  void fetch() async {
    changeLoading();
    usersList = await clientServices.fetchUsersItem() ?? [];
    changeLoading();
  }
}
