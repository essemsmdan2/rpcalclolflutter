import 'package:flutter/material.dart';
import 'package:rpcalclol/constants.dart';
import 'package:rpcalclol/rp_calc_brain.dart';

bool showList = false;
void toggleShowList(bool value) {
  showList = value;
}

class ListResults extends StatelessWidget {
  Calculator arrayResults = Calculator();
  var items;
  ListResults({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {},
              child: BuildCards(
                nomePagamento: items[index]["NomePagamento"].single.toString(),
                precoMoeda: items[index]["PreçoMoeda"].toString(),
                precoRp: items[index]["PreçoRp"].toString(),
              ));
        });
  }
}

class BuildCards extends StatelessWidget {
  const BuildCards({Key? key, required this.nomePagamento, required this.precoMoeda, required this.precoRp}) : super(key: key);

  final String nomePagamento;
  final String precoMoeda;
  final String precoRp;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(color: kPrimaryColor.withOpacity(0.9), borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Método: $nomePagamento",
            textAlign: TextAlign.center,
            style: kresultText,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "RP: $precoRp - R\$: $precoMoeda,00 ",
            textAlign: TextAlign.center,
            style: kresultText,
          ),
        ],
      ),
    );
  }
}

/*

child: Text(
items[index].toString(),
textAlign: TextAlign.center,
style: kInputMenuText,
),
)
*/

/*
Container(
color: kPrimaryColor,
margin: const EdgeInsets.all(10),
child: Text(
items[index].toString(),
textAlign: TextAlign.center,
style: kInputMenuText,
),
)*/
