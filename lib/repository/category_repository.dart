import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';
import '../model/category_model.dart';
import '../resources/app_url.dart';

class CategoryRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future fetchCategoryData() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.categoryApiEndPoint);
      var result = CategoryModel.fromJson(response);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
