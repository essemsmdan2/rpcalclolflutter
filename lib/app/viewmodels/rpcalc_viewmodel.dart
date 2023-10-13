import 'package:rpcalclol/app/models/payment_types_model.dart';
import 'package:rpcalclol/app/models/payment_types_values_model.dart';
import 'package:rpcalclol/app/presentation/pages/home/components/list_builder.dart';
import 'package:rpcalclol/app/repository/firebase/firebase_repository_interface.dart';

class RpCalcViewModel {
  IFirebaseRepository repository;
  double rpPriceInput = 0;
  List<PaymentTypesModel> arrayResultFromShuffle = [];
  List<PaymentTypesModel> arrayTiposPag = [];
  RpCalcViewModel({required this.repository}) {
    _init();
  }

  void _init() async {
    arrayTiposPag = await repository.getUpdatePaymentTypes();
  }

  double sendInputRpPrice(String inputRp) {
    if (inputRp.isNotEmpty) {
      toggleShowList(true);

      rpPriceInput = double.parse(inputRp);
    } else {
      toggleShowList(false);
    }
    return rpPriceInput;
  }

  // List<PaymentTypesModel> filterRPPaymentTypes(
  //     List<PaymentTypesModel> lista, double valorMinimoRP) {
  //   return lista.where((paymentType) {
  //     return paymentType.arrayValues.any((value) => value.RP <= valorMinimoRP);
  //   }).toList();
  // }

  List<PaymentTypesModel> filterPaymentValues(
      List<PaymentTypesModel> lista, double valorMinimoRP) {
    final List<PaymentTypesModel> result = lista
        .map(
          (e) => PaymentTypesModel(
              nameType: e.nameType,
              arrayValues: e.arrayValues
                  .where((element) => element.RP >= valorMinimoRP)
                  .toList()),
        )
        .toList();
    result.removeWhere((element) => element.arrayValues.isEmpty);
    result.removeWhere((e) => e.arrayValues.first.RP >= valorMinimoRP * 2);

    return result;
  }

  Future<List<PaymentTypesModel>> getResults({double? inputRp}) async {
    return await _criaResultadosArray(inputRp ?? rpPriceInput);
  }

  Future<List<PaymentTypesModel>> _criaResultadosArray(double rpValue) async {
    if (arrayTiposPag.isEmpty) {
      arrayTiposPag = await repository.getUpdatePaymentTypes();
    }

    if (arrayResultFromShuffle.isNotEmpty) {
      arrayResultFromShuffle = [];
    }

    return arrayResultFromShuffle = filterPaymentValues(arrayTiposPag, rpValue);
  }
}
