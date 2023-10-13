import 'package:rpcalclol/app/models/apiadvisor_model.dart';
import 'package:rpcalclol/app/models/payment_types_model.dart';
import 'package:rpcalclol/app/viewmodels/apiadvisor_viewmodel.dart';
import 'package:rpcalclol/app/viewmodels/rpcalc_viewmodel.dart';

class HomeController {
  final ApiAdvisorViewModel apiAdvisorViewModel;
  final RpCalcViewModel rpCalcViewModel;
  HomeController(
      {required this.apiAdvisorViewModel, required this.rpCalcViewModel});

  ApiAdvisorModel? get weather => apiAdvisorViewModel.apiAdvisorModel.value;
  List<PaymentTypesModel> get result => rpCalcViewModel.arrayResultFromShuffle;

  getTime() async {
    await apiAdvisorViewModel.fill();
  }

  Future<List<PaymentTypesModel>> getResults({double? inputRp}) async {
    return rpCalcViewModel.getResults(inputRp: inputRp);
  }

  sendInputRpPrice(dynamic value) {
    rpCalcViewModel.sendInputRpPrice(value);
  }
}
