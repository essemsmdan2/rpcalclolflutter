import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseHandler {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List _arrayTiposPag = [];
  //a lista abaixo só é de uso em ambiente de desenvolvimento para update
  List _cartaoBoleto = [
    {
      //Pg-Domestico - Boleto bancário - Gold,Paypal,Pagseguro - Itaú,Banco do Brasil,Bradesco, HSBC - VISA, MASTERCARD, HIPERCARD,AURA,ELO,DISCOVER,ALGUM OUTRO

      'Cartão/Boleto': [
        {'R\$': 16.00, 'RP': 650},
        {'R\$': 32.00, 'RP': 1300},
        {'R\$': 64.00, 'RP': 2600},
        {'R\$': 113.00, 'RP': 4590},
        {'R\$': 160.00, 'RP': 6500},
        {'R\$': 320.00, 'RP': 13000},
      ],
    },
  ];

  List _paySafe = [
    {
      'PaySafe': [
        {'R\$': 10.0, 'RP': 405},
        {'R\$': 20.0, 'RP': 810},
        {'R\$': 25.0, 'RP': 1015},
        {'R\$': 40.0, 'RP': 1620},
        {'R\$': 50.0, 'RP': 2025},
        {'R\$': 100.0, 'RP': 4050},
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
//esse metodo está sendo implementado no arquivo  RpCalcBrain.updateArrayResult
  Future<void> sendUpdatePaymentTypes() async {
    await _firestorageCollectionPaymentTypes
        .get()
        .then((value) => {
              value.docs.forEach((snapshot) {
                snapshot.reference.delete();
              })
            })
        .then((value) => print('deleted'));

    //return paymentTypes.add({'test': 'test'}).then((value) => print("User Added")).catchError((error) => print("Failed to' add user: $error"));
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
