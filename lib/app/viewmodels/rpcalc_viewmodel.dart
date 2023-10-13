import 'package:rpcalclol/app/models/payment_types_model.dart';
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

  sendInputRpPrice(String inputRp) {
    if (inputRp.isNotEmpty) {
      toggleShowList(true);

      rpPriceInput = double.parse(inputRp);
    } else {
      toggleShowList(false);
    }
  }

  getResults() {
    criaResultadosArray(rpPriceInput);

    return arrayResultFromShuffle;
  }

  criaResultadosArray(double rpValue) {
    List result = [];
    if (arrayResultFromShuffle.isNotEmpty) {
      arrayResultFromShuffle = [];
    }
    final rp = rpValue;
    result = arrayResultFromShuffle.map((e) => e.arrayValues.any((element) => element.RP >= rp)).toList();
    return result;

    // for (var index = 0; index < arrayTiposPag.length; index++) {
    //   PaymentTypesModel paymentMethod = arrayTiposPag[index];

    // for (var index = 0; index < arrayValues.length; index++) {
    //   var objPreco = arrayValues[index];

    //   if (objPreco['RP']! >= rp && objPreco['RP']! <= rp * 2) {
    //     final Map<String, dynamic> _MapResult = {};
    //     _MapResult["NomePagamento"] = mapMetodoPag.keys;
    //     _MapResult["PreçoRp"] = objPreco['RP'];
    //     _MapResult["PreçoMoeda"] = objPreco['R\$'].toStringAsFixed(2);
    //     arrayResultFromShuffle.add(PaymentTypesModel.fromMap(_MapResult));
    //   }
    // }
  }
}
