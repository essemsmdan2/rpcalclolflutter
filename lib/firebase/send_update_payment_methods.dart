import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
List _arrayTiposPag = [];
List CartaoBoleto = [
  {
    //Pg-Domestico - Boleto bancário - Gold,Paypal,Pagseguro - Itaú,Banco do Brasil,Bradesco, HSBC - VISA, MASTERCARD, HIPERCARD,AURA,ELO,DISCOVER,ALGUM OUTRO

    'Cartão/Boleto': [
      {'R\$': 13.65, 'RP': 650},
      {'R\$': 27.25, 'RP': 1300},
      {'R\$': 54.5, 'RP': 2600},
      {'R\$': 95.5, 'RP': 4550},
      {'R\$': 136.25, 'RP': 6500},
      {'R\$': 272.5, 'RP': 13000},
    ],
  },
];

List PaySafe = [
  {
    'PaySafe': [
      {'R\$': 10.0, 'RP': 480},
      {'R\$': 20.0, 'RP': 960},
      {'R\$': 25.0, 'RP': 1200},
      {'R\$': 40.0, 'RP': 1920},
      {'R\$': 50.0, 'RP': 2400},
      {'R\$': 100.0, 'RP': 4800},
    ],
  },
];
List Celular = [
  {
    'CelularSms': [
      {'R\$': 4.99, 'RP': 135},
      {'R\$': 9.99, 'RP': 275},
    ],
  },
];

class UpdateStatus {
  CollectionReference paymentTypes = FirebaseFirestore.instance.collection('paymentTypes');

  Future<void> updatePaymentTypes() async {
    //return paymentTypes.add({'test': 'test'}).then((value) => print("User Added")).catchError((error) => print("Failed to add user: $error"));
    try {
      for (final payment in CartaoBoleto) {
        paymentTypes.add(payment).then((value) => print("User Added")).catchError((error) => print("Failed to add user: $error"));
      }
      for (final payment in PaySafe) {
        paymentTypes.add(payment).then((value) => print("User Added")).catchError((error) => print("Failed to add user: $error"));
      }
      for (final payment in Celular) {
        paymentTypes.add(payment).then((value) => print("User Added")).catchError((error) => print("Failed to add user: $error"));
      }
    } catch (e) {
      print(e);
    }

    /* for( var index = 0 ; index < _arrayTiposPag.length ; index++ ) {
     print()
    }*/
  }
}
