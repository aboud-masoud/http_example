import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http_example/models/placeType_model.dart';
import 'package:http_example/models/regions_model.dart';
import 'package:http_example/models/setAddressType_model.dart';
import 'package:http_example/utils/http_repositry.dart';

class AddNewAddressBloc {
  TextEditingController posName = TextEditingController();
  TextEditingController lat = TextEditingController(text: "35.9826676533323");
  TextEditingController long = TextEditingController(text: "35.181633226273323");

  PlaceTypeData? selectedPlaceType;
  String? selectedRegion;
  StreamController<List<Region>?> regionListStream = StreamController<List<Region>?>();

  Future<SetAddreeTypeModel> addNewAddress() async {
    var res = await HttpRequest().callRequest(requestType: REQUEST_TYPE.post, methodName: "address", body: {
      "latitude": lat.text,
      "longitude": long.text,
      "city_id": "1",
      "region_id": "17",
      "type": selectedPlaceType!.id,
      "pos_name": posName.text,
    });

    return SetAddreeTypeModel.fromJson(res);
  }

  void getRegions() async {
    HttpRequest().callRequest(requestType: REQUEST_TYPE.get, methodName: "address/regions", queryParam: {
      "city_id": 1,
    }).then((value) {
      print("working fine");
      var res = RegionsModel.fromJson(value);
      regionListStream.add(res.data!.region!);
    });
  }

  bool validateFields() {
    if (posName.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
