
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:app/features/cubit/init_cubit/cubit.dart';

final service = GetIt.instance;

Future<void> init() async {
  service.registerLazySingleton(() => FlutterSecureStorage());
 
  // StateManagment
  //service.registerLazySingleton(() => PrController(service()));
  service.registerLazySingleton(() => CounterCubit(service()));
  // service.registerLazySingleton(() => CounterBloc(cubit: service<CounterCubit>()));
  // Use Case

  // Repository -> repository repository_impl, data_source -> local, remote
  // service.registerLazySingleton<PrLocalHive>(() => PrLocalHiveimpl());
  // service.registerLazySingleton<PrRepository>(
  //   () => PrRepositoryImpl(
  //     local: service(),
  //   ),
  // );
  // External -> Hive, SharedPrefrences ..

  // await service<PrLocalHive>().initDb();
}
