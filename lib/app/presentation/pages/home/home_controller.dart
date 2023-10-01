import 'package:rpcalclol/app/models/apiadvisor_model.dart';
import 'package:rpcalclol/app/viewmodels/apiadvisor_viewmodel.dart';

class HomeController {
  final ApiAdvisorViewModel viewModel;
  HomeController({
    required this.viewModel,
  });

  ApiAdvisorModel? get weather => viewModel.apiAdvisorModel.value;

  getTime() async {
    await viewModel.fill();
  }
}
