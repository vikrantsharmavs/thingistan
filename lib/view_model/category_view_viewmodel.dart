import 'package:flutter/cupertino.dart';

import '../data/response/api_response.dart';
import '../model/category_model.dart';
import '../repository/category_repository.dart';
import '../utilities/utils.dart';

class CategoryViewViewModel extends ChangeNotifier {
  final _categoryRepo = CategoryRepository();
  ApiResponse<CategoryModel> categoryList = ApiResponse.loading();

  setCategoryData(ApiResponse<CategoryModel> response) {
    categoryList = response;
    notifyListeners();
  }

  Future<void> categoryData(BuildContext context) async {
    setCategoryData(ApiResponse.loading());

    _categoryRepo.fetchCategoryData().then((value) {
      setCategoryData(
        ApiResponse.completed(value),
      );
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(context, error.toString());
      setCategoryData(ApiResponse.error(error.toString()));
    });
  }
}
