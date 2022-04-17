class PlaceTypeModel {
  bool? status;
  List<PlaceTypeData>? data;
  String? message;
  String? requestId;

  PlaceTypeModel({this.status, this.data, this.message, this.requestId});

  PlaceTypeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <PlaceTypeData>[];
      json['data'].forEach((v) {
        data!.add(PlaceTypeData.fromJson(v));
      });
    }
    message = json['message'];
    requestId = json['request_id'];
  }
}

class PlaceTypeData {
  int? id;
  String? name;
  String? icon;

  PlaceTypeData({this.id, this.name, this.icon});

  PlaceTypeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }
}
