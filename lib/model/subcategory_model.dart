class SubcategoryModel {
  List<Result>? result;

  SubcategoryModel({this.result});

  SubcategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? subcatId;
  String? catId;
  String? subcatName;
  String? subcatDesc;
  String? subcatInfo;
  String? subcatImage;
  String? status;

  Result(
      {this.subcatId,
      this.catId,
      this.subcatName,
      this.subcatDesc,
      this.subcatInfo,
      this.subcatImage,
      this.status});

  Result.fromJson(Map<String, dynamic> json) {
    subcatId = json['subcat_id'];
    catId = json['cat_id'];
    subcatName = json['subcat_name'];
    subcatDesc = json['subcat_desc'];
    subcatInfo = json['subcat_info'];
    subcatImage = json['subcat_image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subcat_id'] = subcatId;
    data['cat_id'] = catId;
    data['subcat_name'] = subcatName;
    data['subcat_desc'] = subcatDesc;
    data['subcat_info'] = subcatInfo;
    data['subcat_image'] = subcatImage;
    data['status'] = status;
    return data;
  }
}
