import 'package:app/di/service.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app/core/get_storage_keys.dart';

class InterceptorsApp extends QueuedInterceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Accept"] = "application/json";
    String? token = service<GetStorage>().read(GetStorageKeys.accessToken);
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
  void onError(DioException error, ErrorInterceptorHandler handler) async{
    super.onError(error, handler);
    // if(error.response?.statusCode==401){
    //   final newAccessToken = await (() async => {
    //     // try{
    //     //   service<Dio>().get()
    //     // }
    //   });
    //   if(newAccessToken!=null){
    //     return handler.resolve(await )
    //   }
    // }
  }
}
