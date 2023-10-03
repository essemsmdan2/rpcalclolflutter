import 'package:rpcalclol/app/interfaces/client_http_interface.dart';
import 'package:dio/dio.dart';

class DioHttpService implements IClientHttp {
  final Dio dio = Dio();
  @override
  void addToken(String token) {}

  @override
  Future get(String url) async {
    final Response<dynamic> response = await dio.get(url);
    return response.data;
  }
}
