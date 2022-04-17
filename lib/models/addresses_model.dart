class ListOfAddresses {
  bool? status;
  List<ListOfAddressesData>? data;
  String? message;
  String? requestId;

  ListOfAddresses({this.status, this.data, this.message, this.requestId});

  ListOfAddresses.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <ListOfAddressesData>[];
      json['data'].forEach((v) {
        data!.add(new ListOfAddressesData.fromJson(v));
      });
    }
    message = json['message'];
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['request_id'] = this.requestId;
    return data;
  }
}

class ListOfAddressesData {
  int? addressId;
  String? posName;
  String? building;
  String? floor;
  int? type;
  String? latitude;
  String? longitude;
  int? isDefault;
  String? posImage;
  String? street;
  int? cityId;
  int? regionId;
  String? licenceImage;
  String? locationPhoneNumber;
  String? apartmentNumber;
  String? qrHash;

  ListOfAddressesData(
      {this.addressId,
      this.posName,
      this.building,
      this.floor,
      this.type,
      this.latitude,
      this.longitude,
      this.isDefault,
      this.posImage,
      this.street,
      this.cityId,
      this.regionId,
      this.licenceImage,
      this.locationPhoneNumber,
      this.apartmentNumber,
      this.qrHash});

  ListOfAddressesData.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    posName = json['pos_name'];
    building = json['building'];
    floor = json['floor'];
    type = json['type'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isDefault = json['is_default'];
    posImage = json['pos_image'];
    street = json['street'];
    cityId = json['city_id'];
    regionId = json['region_id'];
    licenceImage = json['licence_image'];
    locationPhoneNumber = json['location_phone_number'];
    apartmentNumber = json['apartment_number'];
    qrHash = json['qr_hash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['pos_name'] = this.posName;
    data['building'] = this.building;
    data['floor'] = this.floor;
    data['type'] = this.type;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['is_default'] = this.isDefault;
    data['pos_image'] = this.posImage;
    data['street'] = this.street;
    data['city_id'] = this.cityId;
    data['region_id'] = this.regionId;
    data['licence_image'] = this.licenceImage;
    data['location_phone_number'] = this.locationPhoneNumber;
    data['apartment_number'] = this.apartmentNumber;
    data['qr_hash'] = this.qrHash;
    return data;
  }
}
