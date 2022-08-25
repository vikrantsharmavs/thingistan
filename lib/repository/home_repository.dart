import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';
import '../model/banner_model.dart';
import '../resources/app_url.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<BannerModel> bannerApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.bannerApi);
      var result = BannerModel.fromJson(response);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
