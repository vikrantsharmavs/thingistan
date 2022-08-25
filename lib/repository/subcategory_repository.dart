import 'package:thingistan/data/network/BaseApiServices.dart';
import 'package:thingistan/data/network/NetworkApiServices.dart';
import 'package:thingistan/model/subcategory_model.dart';
import 'package:thingistan/resources/app_url.dart';

class SubcategoryRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<SubcategoryModel> fetchSubcategory(id) async {
    try {
      var url = AppUrl.subcategoryApiEndPoint + id;
      var response = await _apiServices.getGetApiResponse(url);
      var result = SubcategoryModel.fromJson(response);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
