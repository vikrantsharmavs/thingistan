class CategoryModel {
  List<Results>? results;

  CategoryModel({this.results});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_id'] = this.catId;
    data['cat_name'] = this.catName;
    data['cat_image'] = this.catImage;
    data['cat_desc'] = this.catDesc;
    data['cat_info'] = this.catInfo;
    data['creation_date'] = this.creationDate;
    data['updated_date'] = this.updatedDate;
    data['status'] = this.status;
    return data;
  }
}
