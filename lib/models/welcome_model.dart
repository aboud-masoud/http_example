class WelcomeModel {
  bool? status;
  WelcomeData? data;
  String? message;
  String? requestId;

  WelcomeModel({this.status, this.data, this.message, this.requestId});

  WelcomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? WelcomeData.fromJson(json['data']) : null;
    message = json['message'];
    requestId = json['request_id'];
  }
}

class WelcomeData {
  List<Countries>? countries;
  AppVersion? appVersion;
  String? appIcon;
  String? appIconSelected;
  String? apikey;
  String? userId;
  String? defaultAddressId;
  int? defaultAddressType;
  int? notificationCount;
  int? cartCount;
  PromotionPopup? promotionPopup;
  bool? requiredData;
  int? isBlocked;
  int? isVerified;
  int? loyaltyPoints;

  WelcomeData(
      {this.countries,
      this.appVersion,
      this.appIcon,
      this.appIconSelected,
      this.apikey,
      this.userId,
      this.defaultAddressId,
      this.defaultAddressType,
      this.notificationCount,
      this.cartCount,
      this.promotionPopup,
      this.requiredData,
      this.isBlocked,
      this.isVerified,
      this.loyaltyPoints});

  WelcomeData.fromJson(Map<String, dynamic> json) {
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(new Countries.fromJson(v));
      });
    }
    appVersion = json['app_version'] != null ? new AppVersion.fromJson(json['app_version']) : null;
    appIcon = json['app_icon'];
    appIconSelected = json['app_icon_selected'];
    apikey = json['apikey'];
    userId = json['user_id'];
    defaultAddressId = json['default_address_id'];
    defaultAddressType = json['default_address_type'];
    notificationCount = json['notification_count'];
    cartCount = json['cart_count'];
    promotionPopup = json['promotion_popup'] != null ? new PromotionPopup.fromJson(json['promotion_popup']) : null;
    requiredData = json['required_data'];
    isBlocked = json['is_blocked'];
    isVerified = json['is_verified'];
    loyaltyPoints = json['loyalty_points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.countries != null) {
      data['countries'] = this.countries!.map((v) => v.toJson()).toList();
    }
    if (this.appVersion != null) {
      data['app_version'] = this.appVersion!.toJson();
    }
    data['app_icon'] = this.appIcon;
    data['app_icon_selected'] = this.appIconSelected;
    data['apikey'] = this.apikey;
    data['user_id'] = this.userId;
    data['default_address_id'] = this.defaultAddressId;
    data['default_address_type'] = this.defaultAddressType;
    data['notification_count'] = this.notificationCount;
    data['cart_count'] = this.cartCount;
    if (this.promotionPopup != null) {
      data['promotion_popup'] = this.promotionPopup!.toJson();
    }
    data['required_data'] = this.requiredData;
    data['is_blocked'] = this.isBlocked;
    data['is_verified'] = this.isVerified;
    data['loyalty_points'] = this.loyaltyPoints;
    return data;
  }
}

class Countries {
  int? id;
  String? name;
  String? flag;
  String? currency;
  String? code;

  Countries({this.id, this.name, this.flag, this.currency, this.code});

  Countries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    flag = json['flag'];
    currency = json['currency'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['flag'] = this.flag;
    data['currency'] = this.currency;
    data['code'] = this.code;
    return data;
  }
}

class AppVersion {
  VersionAndroid? versionAndroid;
  VersionAndroid? versionIos;

  AppVersion({this.versionAndroid, this.versionIos});

  AppVersion.fromJson(Map<String, dynamic> json) {
    versionAndroid = json['version_android'] != null ? new VersionAndroid.fromJson(json['version_android']) : null;
    versionIos = json['version_ios'] != null ? new VersionAndroid.fromJson(json['version_ios']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.versionAndroid != null) {
      data['version_android'] = this.versionAndroid!.toJson();
    }
    if (this.versionIos != null) {
      data['version_ios'] = this.versionIos!.toJson();
    }
    return data;
  }
}

class VersionAndroid {
  String? version;
  int? isForced;

  VersionAndroid({this.version, this.isForced});

  VersionAndroid.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    isForced = json['is_forced'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['is_forced'] = this.isForced;
    return data;
  }
}

class PromotionPopup {
  int? id;
  String? image;
  int? showEveryTime;

  PromotionPopup({this.id, this.image, this.showEveryTime});

  PromotionPopup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    showEveryTime = json['show_every_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['show_every_time'] = this.showEveryTime;
    return data;
  }
}
