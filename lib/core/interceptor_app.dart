import 'package:app/di/service.dart';
import 'package:app/features/domain/repository/tokens_repository.dart';
import 'package:dio/dio.dart';

class InterceptorsApp extends QueuedInterceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Accept"] = "application/json";

    TokensRepository tokenRepository = service<TokensRepository>();
    String token = "";
    if(options.path.contains("/token/refresh")){
      token = tokenRepository.getRefreshToken();
    }
    else{
      token = tokenRepository.getAccessToken();
    }
    options.headers["Authorization"] = "Bearer " + token;

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
    TokensRepository tokenRepository = service<TokensRepository>();
    if (err.response?.statusCode == 401) {
      try {
        final data = await service<Dio>().get(
          '/token/refresh',
        );
        tokenRepository.setTokens(data.data["tokens"]["access"], tokenRepository.getRefreshToken());
      } on DioException catch (_) {
        await tokenRepository.logOut();
      }
    }
    else{
        await tokenRepository.logOut();
    }
  }
}
