class RegionsModel {
  bool? status;
  RegionData? data;
  String? message;
  String? requestId;

  RegionsModel({this.status, this.data, this.message, this.requestId});

  RegionsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new RegionData.fromJson(json['data']) : null;
    message = json['message'];
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['request_id'] = this.requestId;
    return data;
  }
}

class RegionData {
  List<Region>? region;

  RegionData({this.region});

  RegionData.fromJson(Map<String, dynamic> json) {
    if (json['region'] != null) {
      region = <Region>[];
      json['region'].forEach((v) {
        region!.add(new Region.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.region != null) {
      data['region'] = this.region!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Region {
  int? id;
  String? name;

  Region({this.id, this.name});

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
