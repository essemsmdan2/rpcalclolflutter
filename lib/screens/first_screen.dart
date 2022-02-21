import 'package:flutter/services.dart';
import 'package:rpcalclol/firebase/send_update_payment_methods.dart';
import '../constants.dart';
import 'package:flutter/material.dart';
import '../components/type_rp_menu.dart';
import '../components/list_builder.dart';
import 'package:rpcalclol/rp_calc_brain.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    super.initState();

    UpdateStatus().updatePaymentTypes();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  Calculator arrayResults = Calculator();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
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
                Expanded(
                  child: Text(
                    'LEAGUE OF LEGENDS',
                    style: kAppBarText,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage('images/backgroundImage.jpg'))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: showList == true ? MainAxisAlignment.end : MainAxisAlignment.center,
                  children: [
                    TypeRpMenu(
                      onChanged: (value) {
                        setState(() {
                          Calculator().sendRpPrice(value);
                        });
                      },
                    ),
                  ],
                ),
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
                    )
            ],
          ),
        ));
  }
}
