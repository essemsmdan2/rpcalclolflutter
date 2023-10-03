import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rpcalclol/app/presentation/pages/home/first_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

//TODO: ADD BUY ME A COFFE
