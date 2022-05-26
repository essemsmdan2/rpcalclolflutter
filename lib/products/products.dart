/*
import 'dart:async';

import 'package:in_app_purchase/in_app_purchase.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  _MarketScreenState createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  InAppPurchase _iap = InAppPurchase.instance;
  bool _available = true;
  List<ProductDetails> _products = [];
  List<PurchaseDetails> _purchases = [];
  late StreamSubscription<List<PurchaseDetails>> _subscription;

  int _credits = 0;
  @override
  void initState() {
   // _initialize();
    super.initState();

  }

  @override
  void dispose() {
   // _subscription.cancel
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          for(var prod in _products){
            if(_)
          }
        ],
      ),
    );
  }



}
*/
