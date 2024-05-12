import 'package:app/di/service.dart';
import 'package:app/features/presentation/ui/profile/bloc/user/user_cubit.dart';
import 'package:app/features/presentation/ui/register/bloc/register/register_cubit.dart';
import 'package:app/features/presentation/ui/sign_in/bloc/cubit/sign_in_cubit.dart';
import 'package:app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:app/features/presentation/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/features/presentation/bloc/theme/theme_cubit.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => UserCubit(service())..init(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(service())..init(),
        ),
        BlocProvider(
          create: (context) => SignInCubit(service())..init(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: darkTheme,
        routerConfig: _router.config(),
      ),
    );
  }
}
