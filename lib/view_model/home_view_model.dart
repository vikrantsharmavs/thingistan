import 'package:flutter/cupertino.dart';

import '../data/response/api_response.dart';
import '../model/banner_model.dart';
import '../repository/home_repository.dart';
import '../utilities/utils.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();
  ApiResponse<BannerModel> bannerList = ApiResponse.loading();

  setBannerList(ApiResponse<BannerModel> response) {
    bannerList = response;
    notifyListeners();
  }

  Future<void> fetchBannerApi(BuildContext context) async {
    setBannerList(ApiResponse.loading());

    _myRepo.bannerApi().then((value) {
      setBannerList(
        ApiResponse.completed(value),
      );
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(context, error.toString());
      setBannerList(ApiResponse.error(error.toString()));
    });
  }
}
