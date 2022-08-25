import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';
import '../repository/auth_repository.dart';
import '../utilities/routes/routes_name.dart';
import '../utilities/utils.dart';
import 'user_view_model.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApiModel(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      final userPreferences =
          Provider.of<UserViewModel>(context, listen: false);
      userPreferences.saveUser(
        UserModel(
          token: value['token'].toString(),
        ),
      );

      Utils.flushBarSuccessMessage(context, "Login SuccessFully");
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(context, error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
