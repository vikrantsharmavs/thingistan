class CategoryModel {
  List<Results>? results;

  CategoryModel({this.results});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? catId;
  String? catName;
  String? catImage;
  String? catDesc;
  String? catInfo;
  String? creationDate;
  String? updatedDate;
  String? status;

  Results(
      {this.catId,
      this.catName,
      this.catImage,
      this.catDesc,
      this.catInfo,
      this.creationDate,
      this.updatedDate,
      this.status});

  Results.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    catName = json['cat_name'];
    catImage = json['cat_image'];
    catDesc = json['cat_desc'];
    catInfo = json['cat_info'];
    creationDate = json['creation_date'];
    updatedDate = json['updated_date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cat_id'] = catId;
    data['cat_name'] = catName;
    data['cat_image'] = catImage;
    data['cat_desc'] = catDesc;
    data['cat_info'] = catInfo;
    data['creation_date'] = creationDate;
    data['updated_date'] = updatedDate;
    data['status'] = status;
    return data;
  }
}
