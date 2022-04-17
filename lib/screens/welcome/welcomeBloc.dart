import 'dart:async';

import 'package:http_example/models/welcome_model.dart';
import 'package:http_example/utils/http_repositry.dart';

class WelcomeBloc {
  StreamController<WelcomeModel?> responceStream = StreamController<WelcomeModel?>();

  callWelcomeRequest() async {
    final res = await HttpRequest().callRequest(requestType: REQUEST_TYPE.get, methodName: "welcome?ignore_cache: 1");

    responceStream.sink.add(WelcomeModel.fromJson(res));
  }
}
