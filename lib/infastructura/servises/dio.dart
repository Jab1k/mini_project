import 'package:dio/dio.dart';
import 'package:setup_provider/infastructura/servises/app_constant.dart';

abstract class DioService {
  DioService._();

  static Dio client({
    String? token,
  }) {
    return Dio(BaseOptions(
      baseUrl: AppConstant.baseUrl,
      headers: {
        if (token != null) "Authorization": "Bearer $token",
        'Accept':
            'application/json, application/geo+json, application/gpx+xml, img/png; charset=utf-8',
        'Content-type': 'application/json'
      },
    ))
      ..interceptors.add(LogInterceptor(
          responseBody: true,
          requestBody: true,
          requestHeader: true,
          responseHeader: false));
  }
}
