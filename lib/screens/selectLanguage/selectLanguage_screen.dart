import 'package:flutter/material.dart';
import 'package:http_example/screens/select_address_type/selectAddressType_Screen.dart';
import 'package:http_example/utils/singilton.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              languageWidget(context, "en"),
              const SizedBox(
                height: 10,
              ),
              languageWidget(context, "ar")
            ],
          ),
        ),
      ),
    );
  }

  InkWell languageWidget(context, String lang) {
    return InkWell(
      onTap: () {
        print(lang);
        Singleton.singleton.selectedLanguage = lang;

        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) {
          return SelectAddressTypeScreen();
        }), (route) => false);
      },
      child: Container(
        width: 100,
        height: 50,
        color: Colors.red,
        child: Center(
          child: Text(
            lang,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
