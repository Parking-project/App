import 'package:app/features/data/repository/settings_repository_impl.dart';
import 'package:app/features/domain/repository/settings_repository.dart';
import 'package:app/features/data/repository/tokens_repository_impl.dart';
import 'package:app/features/domain/repository/tokens_repository.dart';
import 'package:app/features/presentation/ui/place_set/bloc/place_set/place_set_cubit.dart';
import 'package:app/features/presentation/ui/reserve_list/reserve_list/reserve_list_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:app/core/interceptor_app.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app/features/domain/repository/user_api_repository.dart';
import 'package:app/features/domain/repository/auth_api_repository.dart';
import 'package:app/features/domain/repository/place_api_repository.dart';
import 'package:app/features/domain/repository/reserve_api_repository.dart';

import 'package:app/features/data/repository/user_api_repository_impl.dart';
import 'package:app/features/data/repository/auth_api_repository_impl.dart';
import 'package:app/features/data/repository/place_api_repository_impl.dart';
import 'package:app/features/data/repository/reserve_api_repository_impl.dart';

import 'package:app/features/presentation/ui/profile/bloc/user/user_cubit.dart';
import 'package:app/features/presentation/ui/sign_in/bloc/cubit/sign_in_cubit.dart';
import 'package:app/features/presentation/ui/register/bloc/register/register_cubit.dart';

final service = GetIt.instance;

Future<void> init() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  service.registerLazySingleton<SharedPreferences>(
    () => pref,
  );
  
  //"http://localhost:9098";
  final baseUrl = dotenv.env["API_URL"] ?? "";
  service.registerLazySingleton(
    () => Dio(
      BaseOptions(
        headers: {"X-Api-Key": "Ihn3F2x44nf/EbWui5SOFA==YebHR8EAtQWefVF2"},
        baseUrl: baseUrl,
      ),
    )..interceptors.addAll(
        [
          InterceptorsApp(),
          PrettyDioLogger(),
        ],
      ),
  );

  service.registerLazySingleton(
    () => SignInCubit(service(), service())
  );
  service.registerLazySingleton(
    () => RegisterCubit(service(), service())
  );
  service.registerLazySingleton(
    () => UserCubit(service())
  );
  service.registerLazySingleton(
    () => ReserveListCubit(service())
  );
  service.registerLazySingleton(
    () => PlaceSetCubit(service())
  );

  
  service.registerLazySingleton<TokensRepository>(
    () => TokensRepositoryImpl(),
  );
  service.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(),
  );

  service.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(),
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
