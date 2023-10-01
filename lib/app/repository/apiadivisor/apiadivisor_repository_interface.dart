import 'package:rpcalclol/app/models/apiadvisor_model.dart';

abstract class IApiAdvisor {
  Future<ApiAdvisorModel> getTime();
}
