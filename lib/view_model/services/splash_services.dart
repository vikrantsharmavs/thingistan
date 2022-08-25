import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../../model/user_model.dart';
import '../../utilities/routes/routes_name.dart';
import '../user_view_model.dart';

class SplashServices {
  //getter method
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      if (value.token == 'null' || value.token == "") {
        Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
