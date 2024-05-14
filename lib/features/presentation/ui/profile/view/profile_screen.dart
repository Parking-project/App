import 'package:app/features/presentation/ui/profile/bloc/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Профиль",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Профиль",
              style: Theme.of(context).textTheme.titleLarge,
            ),
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
                              "Приветствую ${context.read<UserCubit>().user.displayName}",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
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
      ),
    );
  }
}
