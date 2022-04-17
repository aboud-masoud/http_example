class SetAddreeTypeModel {
  bool? status;
  String? message;
  String? requestId;

  SetAddreeTypeModel({this.status, this.message, this.requestId});

  SetAddreeTypeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    message = json['message'];
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['request_id'] = this.requestId;
    return data;
  }
}
