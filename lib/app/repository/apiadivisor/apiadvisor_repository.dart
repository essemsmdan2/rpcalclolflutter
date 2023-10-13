// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rpcalclol/app/interfaces/client_http_interface.dart';
import 'package:rpcalclol/app/models/apiadvisor_model.dart';
import 'package:rpcalclol/app/repository/apiadivisor/apiadivisor_repository_interface.dart';
import 'package:rpcalclol/app/services/dio_http_service.dart';

class ApiAdvisorRepository implements IApiAdvisor {
  final IClientHttp dioHttpService;
  ApiAdvisorRepository({
    required this.dioHttpService,
  });
  @override
  Future<ApiAdvisorModel> getTime() async {
    final json = await dioHttpService.get('http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=dc7f820c084aa2d0d3d08a7a8845255c');
    return ApiAdvisorModel.fromJson(json[0]);
  }
}
