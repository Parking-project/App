import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app/core/interceptor_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app/features/domain/repository/user_api_repository.dart';
import 'package:app/features/domain/repository/auth_api_repository.dart';
import 'package:app/features/domain/repository/place_api_repository.dart';
import 'package:app/features/domain/repository/message_api_repository.dart';
import 'package:app/features/domain/repository/reserve_api_repository.dart';

import 'package:app/features/data/repository/user_api_repository_impl.dart';
import 'package:app/features/data/repository/auth_api_repository_impl.dart';
import 'package:app/features/data/repository/place_api_repository_impl.dart';
import 'package:app/features/data/repository/message_api_repository_impl.dart';
import 'package:app/features/data/repository/reserve_api_repository_impl.dart';

import 'package:app/features/presentation/ui/profile/bloc/user/user_cubit.dart';
import 'package:app/features/presentation/ui/sign_in/bloc/cubit/sign_in_cubit.dart';
import 'package:app/features/presentation/ui/register/bloc/register/register_cubit.dart';

final service = GetIt.instance;

Future<void> init() async {
  service.registerLazySingleton(
    () => SharedPreferences.getInstance()
  );
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

  service.registerLazySingleton(
    () => SignInCubit(service())
  );
  service.registerLazySingleton(
    () => RegisterCubit(service())
  );
  service.registerLazySingleton(
    () => UserCubit(service())
  );


  service.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(),
  );
  service.registerLazySingleton<MessageRepository>(
    () => MessageRepositoryImpl(),
  );
  service.registerLazySingleton<PlaceRepository>(
    () => PlaceRepositoryImpl(),
  );
  service.registerLazySingleton<ReserveRepository>(
    () => ReserveRepositoryImpl(),
  );
  service.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(),
  );
}
