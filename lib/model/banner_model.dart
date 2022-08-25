class BannerModel {
  List<Result>? result;

  BannerModel({this.result});

  BannerModel.fromJson(Map<String, dynamic> json) {
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
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? id;
  String? catId;
  String? subcatId;
  String? bannerName;
  String? bannerImage;
  String? hexaColorCode;
  String? bannerUrl;
  String? bannerDesc;
  String? creationDate;
  String? updatedDate;
  String? status;

  Result(
      {this.id,
      this.catId,
      this.subcatId,
      this.bannerName,
      this.bannerImage,
      this.hexaColorCode,
      this.bannerUrl,
      this.bannerDesc,
      this.creationDate,
      this.updatedDate,
      this.status});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catId = json['cat_id'];
    subcatId = json['subcat_id'];
    bannerName = json['banner_name'];
    bannerImage = json['banner_image'];
    hexaColorCode = json['hexa_color_code'];
    bannerUrl = json['banner_url'];
    bannerDesc = json['banner_desc'];
    creationDate = json['creation_date'];
    updatedDate = json['updated_date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['cat_id'] = this.catId;
    data['subcat_id'] = this.subcatId;
    data['banner_name'] = this.bannerName;
    data['banner_image'] = this.bannerImage;
    data['hexa_color_code'] = this.hexaColorCode;
    data['banner_url'] = this.bannerUrl;
    data['banner_desc'] = this.bannerDesc;
    data['creation_date'] = this.creationDate;
    data['updated_date'] = this.updatedDate;
    data['status'] = this.status;
    return data;
  }
}
