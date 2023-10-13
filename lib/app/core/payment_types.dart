import 'package:rpcalclol/app/models/payment_types_model.dart';

class PaymentTypesDb {
  PaymentTypesDb() {
    allArrayPaymentTypesModel = allPaymentsArrayJson.map((e) => PaymentTypesModel.fromMap(e)).toList();
  }
  late final List<PaymentTypesModel> allArrayPaymentTypesModel;
  final allPaymentsArrayJson = [
    {
      'nameType': 'Cartão/Boleto',
      'arrayValues': [
        {'coin': 16.00, 'RP': 650},
        {'coin': 32.00, 'RP': 1300},
        {'coin': 64.00, 'RP': 2600},
        {'coin': 113.00, 'RP': 4590},
        {'coin': 160.00, 'RP': 6500},
        {'coin': 320.00, 'RP': 13000},
      ],
    },
    {
      'nameType': 'PaySafe',
      'arrayValues': [
        {'coin': 10.0, 'RP': 405},
        {'coin': 20.0, 'RP': 810},
        {'coin': 25.0, 'RP': 1015},
        {'coin': 40.0, 'RP': 1620},
        {'coin': 50.0, 'RP': 2025},
        {'coin': 100.0, 'RP': 4050},
      ],
    },
    {
      'nameType': 'CelularSms',
      'arrayValues': [
        {'coin': 4.99, 'RP': 135},
        {'coin': 9.99, 'RP': 275},
      ],
    }
  ];
}
