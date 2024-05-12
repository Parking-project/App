import 'package:app/core/interceptor_app.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final service = GetIt.instance;

Future<void> init() async {
  final base_url = dotenv.env["API_URL"] ?? "";
  await GetStorage.init('MyStorage');
  service.registerLazySingleton(
    () => GetStorage('MyStorage')
  );

  service.registerLazySingleton(
    () => Dio(
      BaseOptions(
        headers: {"X-Api-Key": "Ihn3F2x44nf/EbWui5SOFA==YebHR8EAtQWefVF2"},
        baseUrl: base_url,
      ),
    )..interceptors.addAll(
        [
          InterceptorsApp(),
          PrettyDioLogger(),
        ],
      ),
  );
}
