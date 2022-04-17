import 'dart:async';

import 'package:http_example/models/placeType_model.dart';
import 'package:http_example/models/setAddressType_model.dart';
import 'package:http_example/utils/http_repositry.dart';
import 'package:http_example/utils/singilton.dart';

class SelectAddressTypeBloc {
  StreamController<PlaceTypeModel> responceStream = StreamController<PlaceTypeModel>();

  callRequest() async {
    //Markup: haay al request a3anshan ll list
    var res = await HttpRequest().callRequest(requestType: REQUEST_TYPE.get, methodName: "user/place-type");

    Singleton.singleton.listOfPlacesTypes = PlaceTypeModel.fromJson(res).data!;

    responceStream.sink.add(PlaceTypeModel.fromJson(res));
  }

  Future<SetAddreeTypeModel> callSetAddressTypeRequest(int selectedId) async {
    var res = await HttpRequest().callRequest(requestType: REQUEST_TYPE.post, methodName: "user/set-place-type", body: {"place_type": selectedId});

    return SetAddreeTypeModel.fromJson(res);
  }
}
