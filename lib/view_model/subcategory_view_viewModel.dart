// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:thingistan/model/subcategory_model.dart';
import 'package:thingistan/repository/subcategory_repository.dart';

import '../data/response/api_response.dart';
import '../utilities/utils.dart';

class SubcategoryViewViewModel with ChangeNotifier {
  final _myRepo = SubcategoryRepository();
  ApiResponse<SubcategoryModel> subcategoryList = ApiResponse.loading();

  setSubcategory(ApiResponse<SubcategoryModel> response) {
    subcategoryList = response;
    notifyListeners();
  }

  Future<void> fetchSubcategoryApi(BuildContext context, id) async {
    setSubcategory(ApiResponse.loading());

    _myRepo.fetchSubcategory(id).then((value) {
      setSubcategory(
        ApiResponse.completed(value),
      );
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(context, error.toString());
      setSubcategory(ApiResponse.error(error.toString()));
    });
  }
}
