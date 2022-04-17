import 'package:flutter/material.dart';
import 'package:http_example/models/placeType_model.dart';
import 'package:http_example/screens/add_Address/add_address_bloc.dart';
import 'package:http_example/utils/dialogs.dart';
import 'package:http_example/utils/singilton.dart';

class AddAddressScreen extends StatefulWidget {
  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  var bloc = AddNewAddressBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Center(
              child: Text("add address"),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: bloc.posName,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: bloc.lat,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: bloc.long,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16),
                child: DropdownButton<PlaceTypeData>(
                  value: bloc.selectedPlaceType,
                  isExpanded: true,
                  items: Singleton.singleton.listOfPlacesTypes!.map((PlaceTypeData value) {
                    return DropdownMenuItem<PlaceTypeData>(
                      value: value,
                      child: Text(value.name!),
                    );
                  }).toList(),
                  onChanged: (value) {
                    bloc.selectedPlaceType = value!;
                    setState(() {});
                  },
                )),
            Expanded(child: Container()),
            ElevatedButton(
                onPressed: () {
                  bloc.addNewAddress().then((value) {
                    if (value.status!) {
                      Navigator.pop(context);
                    } else {
                      showAlertDialogWithOkButton(
                          context: context,
                          message: value.message!,
                          okButtonPressed: () {
                            Navigator.pop(context);
                          });
                    }
                  });
                },
                child: Container(
                  height: 50,
                  child: Center(child: Text("Submit")),
                ))
          ],
        ),
      ),
    );
  }
}
