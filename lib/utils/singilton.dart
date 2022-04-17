import 'package:http_example/models/placeType_model.dart';

class Singleton {
  static final Singleton singleton = Singleton();

  String selectedLanguage = "en";

  List<PlaceTypeData>? listOfPlacesTypes;
}
