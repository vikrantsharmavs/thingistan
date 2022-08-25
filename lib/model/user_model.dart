class UserModel {
  dynamic status;
  dynamic error;
  dynamic token;
  dynamic messages;

  UserModel({this.status, this.error, this.token, this.messages});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    token = json['token'];
    messages =
        json['messages'] != null ? Messages.fromJson(json['messages']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['error'] = error;
    data['token'] = token;
    if (messages != null) {
      data['messages'] = messages!.toJson();
    }
    return data;
  }
}

class Messages {
  String? success;

  Messages({this.success});

  Messages.fromJson(Map<String, dynamic> json) {
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    return data;
  }
}
