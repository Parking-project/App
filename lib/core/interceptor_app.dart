import 'package:app/di/service.dart';
import 'package:dio/dio.dart';
import 'package:app/core/get_storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InterceptorsApp extends QueuedInterceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Accept"] = "application/json";
    String? token = service<SharedPreferences>().getString(GetStorageKeys.accessToken);
    options.headers["Authorization"] = 'Bearer $token';
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) async {
    super.onError(error, handler);
    SharedPreferences pref = service<SharedPreferences>();
    if (error.response?.statusCode == 401) {
      try {
        final data = await service<Dio>().get(
          '/token/refresh',
        );
        await pref.setString(
            GetStorageKeys.accessToken, data.data["tokens"]["access"]);
      } on DioException catch (_) {
        await pref.clear();
      }
    }
  }
}
