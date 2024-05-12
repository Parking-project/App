import 'package:app/di/service.dart';
import 'package:app/features/presentation/ui/home/bloc/user_cubit.dart';
import 'package:app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:app/features/presentation/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/features/presentation/bloc/theme/theme_cubit.dart';

class Application extends StatefulWidget {
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
          create: (context) => UserCubit(service()),
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
