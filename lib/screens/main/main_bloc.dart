import 'dart:async';

import 'package:http_example/models/addresses_model.dart';
import 'package:http_example/utils/http_repositry.dart';
import 'package:http_example/utils/singilton.dart';

class MainBloc {
  StreamController<ListOfAddresses?> listOfAddress = StreamController<ListOfAddresses?>.broadcast();

  callListOfAddressAPI() {
    HttpRequest().callRequest(requestType: REQUEST_TYPE.get, methodName: "address?ignore_cache=1").then((value) {
      var response = ListOfAddresses.fromJson(value);

      if (response.status!) {
        listOfAddress.sink.add(response);
      }
    });
  }

  callDeleteAddressAPI(int id) {
    HttpRequest().callRequest(requestType: REQUEST_TYPE.delete, methodName: "address/delete?address_id=$id").then((value) {
      listOfAddress.sink.add(null);
      // var response = ListOfAddresses.fromJson(value);
      callListOfAddressAPI();
      // if (response.status!) {
      //   listOfAddress.sink.add(response);
      // }
    });
  }

  String getCorrectImageURL(int type) {
    for (var item in Singleton.singleton.listOfPlacesTypes!) {
      if (item.id == type) {
        return item.icon!;
      }
    }

    return "";
  }
}
