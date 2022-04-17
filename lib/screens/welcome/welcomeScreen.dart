import 'package:flutter/material.dart';
import 'package:http_example/models/welcome_model.dart';
import 'package:http_example/screens/selectLanguage/selectLanguage_screen.dart';
import 'package:http_example/screens/select_address_type/SelectAddressType_Screen.dart';
import 'package:http_example/screens/welcome/welcomeBloc.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var bloc = WelcomeBloc();

  @override
  void initState() {
    bloc.callWelcomeRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: StreamBuilder<WelcomeModel?>(
          stream: bloc.responceStream.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.status!) {
              callSelectAddressPage(context);
            }
            return Center(
              child: snapshot.hasData && snapshot.data!.status! ? Container() : const CircularProgressIndicator(color: Colors.white),
            );
          }),
    );
  }

  callSelectAddressPage(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) {
        return SelectLanguage();
      }), (route) => false);
    });
  }
}
