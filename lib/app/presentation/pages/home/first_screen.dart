import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:rpcalclol/app/presentation/pages/home/components/list_builder.dart';
import 'package:rpcalclol/app/presentation/pages/home/components/type_rp_menu.dart';
import 'package:rpcalclol/app/core/constants.dart';
import 'package:rpcalclol/app/presentation/pages/home/home_controller.dart';
import 'package:rpcalclol/app/repository/apiadivisor/apiadvisor_repository.dart';
import 'package:rpcalclol/app/repository/firebase/firebase_repository.dart';
import 'package:rpcalclol/app/services/dio_http_service.dart';
import 'package:rpcalclol/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:rpcalclol/app/viewmodels/rpcalc_viewmodel.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late HomeController controller;
  @override
  void initState() {
    super.initState();
    //midnight i tell u
    //FirebaseRepository(firestore: FirebaseFirestore.instance).projectZeroDawn();
    controller = HomeController(
        apiAdvisorViewModel: ApiAdvisorViewModel(repository: ApiAdvisorRepository(dioHttpService: DioHttpService())),
        rpCalcViewModel: RpCalcViewModel(repository: FirebaseRepository(firestore: FirebaseFirestore.instance)));
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
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const MySecondPage()));
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
              const SizedBox(
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
                      controller.sendInputRpPrice(value);
                    });
                  },
                ),
              ],
            ),
          ),
          showList == true
              ? Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  height: 5,
                  decoration: const BoxDecoration(boxShadow: [BoxShadow(color: Colors.black, offset: Offset(0, 2), blurRadius: 8, spreadRadius: 3)]),
                )
              : const SizedBox(
                  height: 1,
                ),
          showList == true
              ? Expanded(
                  flex: 1,
                  child: ListResults(
                    items: controller.result,
                  ),
                )
              : const SizedBox(
                  height: 10,
                ),
        ]),
      ),
    );
  }
}
