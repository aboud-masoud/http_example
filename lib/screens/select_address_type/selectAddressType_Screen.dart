import 'package:flutter/material.dart';
import 'package:http_example/models/placeType_model.dart';
import 'package:http_example/screens/main/main_screen.dart';
import 'package:http_example/screens/select_address_type/selectAddressType_bloc.dart';

class SelectAddressTypeScreen extends StatefulWidget {
  SelectAddressTypeScreen({Key? key}) : super(key: key);

  @override
  State<SelectAddressTypeScreen> createState() => _SelectAddressTypeScreenState();
}

class _SelectAddressTypeScreenState extends State<SelectAddressTypeScreen> {
  var bloc = SelectAddressTypeBloc();

  @override
  void initState() {
    super.initState();
    bloc.callRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<PlaceTypeModel>(
          stream: bloc.responceStream.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.status!) {
              return ListView.builder(
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          bloc.callSetAddressTypeRequest(snapshot.data!.data![index].id!).then((value) {
                            if (value.status!) {
                              callHomePage(context);
                            }
                          });
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 8),
                                child: Image.network(
                                  snapshot.data!.data![index].icon!,
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                              Text(
                                snapshot.data!.data![index].name!,
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Container();
            }
          }),
    );
  }

  callHomePage(BuildContext context) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) {
      return const MainScreen();
    }), (route) => false);
  }
}
