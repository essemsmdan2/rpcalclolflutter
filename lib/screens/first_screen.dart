import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../constants.dart';
import 'package:flutter/material.dart';
import '../components/type_rp_menu.dart';
import '../components/list_builder.dart';
import 'package:rpcalclol/rp_calc_brain.dart';

import 'package:url_launcher/url_launcher.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  RpCalcBrain arrayResults = RpCalcBrain();
  @override
  void initState() {
    super.initState();

    //dentro deste metodo existe uma opção para update dos valores
    arrayResults.updateArrayResult();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                launch('https://www.buymeacoffee.com/essemsmdan');
              },
              child: const Icon(
                Icons.coffee_rounded,
                color: Colors.white,
              ),
            )
          ],
          backgroundColor: kPrimaryColor.withOpacity(0.9),
          centerTitle: true,
          toolbarHeight: kAppBarHeight,
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    kLogoImage,
                    width: 42,
                  ),
                ),
                const Expanded(
                  child: Text(
                    'LEAGUE OF\n LEGENDS',
                    style: kAppBarText,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage('images/backgroundImage.jpg'))),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: showList == true ? MainAxisAlignment.end : MainAxisAlignment.center,
                children: [
                  TypeRpMenu(
                    onChanged: (value) {
                      setState(() {
                        RpCalcBrain().sendRpPrice(value);
                      });
                    },
                  ),
                ],
              ),
            ),
            showList == true
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    height: 5,
                    decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black, offset: Offset(0, 2), blurRadius: 8, spreadRadius: 3)]),
                  )
                : SizedBox(
                    height: 1,
                  ),
            showList == true
                ? Expanded(
                    flex: 1,
                    child: ListResults(
                      items: arrayResults.getResults(),
                    ),
                  )
                : SizedBox(
                    height: 10,
                  ),
          ]),
        ));
  }
}
