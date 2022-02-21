import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateStatus {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List _arrayTiposPag = [];
  List _cartaoBoleto = [
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

  List _paySafe = [
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
  List _celular = [
    {
      'CelularSms': [
        {'R\$': 4.99, 'RP': 135},
        {'R\$': 9.99, 'RP': 275},
      ],
    },
  ];

  CollectionReference _firestorageCollectionPaymentTypes = FirebaseFirestore.instance.collection('paymentTypes');

  Future<void> sendUpdatePaymentTypes() async {
    //return paymentTypes.add({'test': 'test'}).then((value) => print("User Added")).catchError((error) => print("Failed to add user: $error"));
    try {
      for (final payment in _cartaoBoleto) {
        _firestorageCollectionPaymentTypes.add(payment).then((value) => print("User Added")).catchError((error) => print("Failed to add user: $error"));
      }
      for (final payment in _paySafe) {
        _firestorageCollectionPaymentTypes.add(payment).then((value) => print("User Added")).catchError((error) => print("Failed to add user: $error"));
      }
      for (final payment in _celular) {
        _firestorageCollectionPaymentTypes.add(payment).then((value) => print("User Added")).catchError((error) => print("Failed to add user: $error"));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<dynamic>> getUpdatePaymentTypes() async {
    final paymentTypesFromGet = await _firestorageCollectionPaymentTypes.get();
    for (var payment in paymentTypesFromGet.docs) {
      _arrayTiposPag.add(payment.data());
    }
    return _arrayTiposPag;
  }
}
