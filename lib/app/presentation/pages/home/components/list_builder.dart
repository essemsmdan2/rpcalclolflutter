import 'package:flutter/material.dart';
import 'package:rpcalclol/app/core/constants.dart';
import 'package:rpcalclol/app/models/payment_types_model.dart';

bool showList = false;
void toggleShowList(bool value) {
  showList = value;
}

class ListResults extends StatelessWidget {
  final List<PaymentTypesModel> items;
  ListResults({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 72,
            ),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: item.arrayValues
                  .asMap()
                  .map((i, e) => MapEntry(
                        i,
                        BuildCards(
                          nomePagamento: item.nameType,
                          precoMoeda: e.coin.toString(),
                          precoRp: e.RP.toString(),
                        ),
                      ))
                  .values
                  .toList(),
            ),
          );
        });
  }
}

class BuildCards extends StatelessWidget {
  const BuildCards(
      {Key? key,
      required this.nomePagamento,
      required this.precoMoeda,
      required this.precoRp})
      : super(key: key);

  final String nomePagamento;
  final String precoMoeda;
  final String precoRp;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            blurRadius: 5,
            spreadRadius: 2,
            color: Colors.purpleAccent.shade100,
          ),
        ],
      ),
      margin: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Método: $nomePagamento",
            textAlign: TextAlign.center,
            style: kresultText,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "RP: $precoRp - R\$: $precoMoeda ",
            textAlign: TextAlign.center,
            style: kresultText,
          ),
        ],
      ),
    );
  }
}
