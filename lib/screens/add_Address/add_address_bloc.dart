import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http_example/models/placeType_model.dart';
import 'package:http_example/models/setAddressType_model.dart';
import 'package:http_example/utils/http_repositry.dart';

class AddNewAddressBloc {
  TextEditingController posName = TextEditingController();
  TextEditingController lat = TextEditingController(text: "35.9826676533323");
  TextEditingController long = TextEditingController(text: "35.181633226273323");

  PlaceTypeData? selectedPlaceType;

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
}
