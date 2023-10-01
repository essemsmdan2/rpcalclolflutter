// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:rpcalclol/app/models/apiadvisor_model.dart';
import 'package:rpcalclol/app/repository/apiadivisor/apiadivisor_repository_interface.dart';

class ApiAdvisorViewModel {
  final IApiAdvisor repository;
  ApiAdvisorViewModel({
    required this.repository,
  });

  final apiAdvisorModel = ValueNotifier<ApiAdvisorModel?>(null);

  fill() async {
    apiAdvisorModel.value = await repository.getTime();
  }
}
