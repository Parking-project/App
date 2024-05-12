import 'package:app/features/presentation/ui/profile/bloc/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Профиль"),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Профиль"),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: BlocBuilder<UserCubit, UserState>(
                    builder: (context, state) {
                      return switch (state) {
                        UserInitial() || UserLoading() => Builder(
                            builder: (context) {
                              context.read<UserCubit>().load();
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                        UserSuccess() => Builder(
                            builder: (context) {
                              return Center(
                                child: Text(
                                    "Success: ${context.read<UserCubit>().user.displayName}"),
                              );
                            },
                          ),
                        UserException() || _ => Builder(
                            builder: (context) {
                              context.read<UserCubit>().load();
                              return const Center(
                                child: Text("Exception"),
                              );
                            },
                          ),
                      };
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
