import 'package:flutter/material.dart';
import 'package:http_example/models/addresses_model.dart';
import 'package:http_example/models/placeType_model.dart';
import 'package:http_example/screens/add_Address/add_address_screen.dart';
import 'package:http_example/screens/main/main_bloc.dart';
import 'package:http_example/utils/dialogs.dart';
import 'package:http_example/utils/singilton.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var bloc = MainBloc();

  @override
  void initState() {
    bloc.callListOfAddressAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var image = Singleton.singleton.listOfPlacesTypes!.where((PlaceTypeData element) => (element.id == 0));

    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<ListOfAddresses?>(
            stream: bloc.listOfAddress.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.data!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                                height: 50,
                                child: Row(
                                  children: [
                                    Image.network(bloc.getCorrectImageURL(snapshot.data!.data![index].type!)),
                                    Text(snapshot.data!.data![index].posName!),
                                    Expanded(child: Container()),
                                    IconButton(
                                        onPressed: () {
                                          showAlertDialog(
                                              context: context,
                                              message: "Do you want to delete this record ?",
                                              cancelButtonPressed: () {
                                                Navigator.pop(context);
                                              },
                                              continueButtonPressed: () {
                                                bloc.callDeleteAddressAPI(snapshot.data!.data![index].addressId!);
                                                Navigator.pop(context);
                                              });
                                        },
                                        icon: const Icon(Icons.close))
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                bloc.callListOfAddressAPI();
                              },
                              child: SizedBox(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: const Center(child: Icon(Icons.refresh)),
                              )),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                                  return AddAddressScreen();
                                })).then((value) {
                                  bloc.callListOfAddressAPI();
                                });
                              },
                              child: SizedBox(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: const Center(
                                    child: Text(
                                  "ADD",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                )),
                              )),
                        ),
                      ],
                    )
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                );
              }
            }),
      ),
    );
  }
}
