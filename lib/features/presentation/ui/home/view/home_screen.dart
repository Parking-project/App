import 'package:app/features/presentation/ui/home/bloc/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // final TextEditingController _title = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Профиль"),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Профиль"),
                const SizedBox(
                  height: 25,
                ),
                BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    return switch (state) {
                      UserInitial() || UserLoading() => Builder(
                          builder: (context) {
                            context.read<UserCubit>().init();
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      UserException() => Builder(
                          builder: (context) {
                            context.read<UserCubit>().init();
                            return const Center(
                              child: Text("Exception"),
                            );
                          },
                        ),
                      UserSuccess() => Builder(
                          builder: (context) {
                            print(context.read<UserCubit>().user);
                            return Center(
                              child: Text("Success: ${context.read<UserCubit>().user.displayName}"),
                            );
                          },
                        ),
                      _ => Builder(
                          builder: (context) {
                            return const Text("Unkwoq exception");
                          },
                        ),
                    };
                  },
                ),
                const Text("Здраствуйте ")
              ],
            ),
          );
        },
      ),
    );
  }
}
