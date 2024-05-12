import 'package:app/features/presentation/ui/sign_in/bloc/cubit/sign_in_cubit.dart';
import 'package:app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  final Function(bool?) onResult;
  SignInScreen({required this.onResult});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Column getButtonState(BuildContext context, String message, bool is_button) {
    if (is_button) {
      return Column(
        children: [
          FilledButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<SignInCubit>().login(
                      loginController.text,
                      passwordController.text,
                    );
              }
            },
            child: Text(
              "Авторизоваться",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          MaterialButton(
            onPressed: () {
              context.router.push(
                RegisterRoute(onResult: onResult),
              );
            },
            child: Text(
              "Регистрация",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            message,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      );
    } else {
      return Column(
        children: [
          const Center(
            child: CircularProgressIndicator(),
          ),
          Text(
            "",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            message,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Окно авторизации",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Авторизация",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 95,
                    child: TextFormField(
                      controller: loginController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "Логин",
                        hintText: "Введите логин",
                        prefixIcon: Icon(Icons.email),
                      ),
                      style: Theme.of(context).textTheme.titleMedium,
                      onChanged: (String value) {},
                      validator: (value) {
                        return value!.isEmpty ? 'Введите логин' : null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 95,
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        labelText: "Пароль",
                        hintText: "Введите пароль",
                        prefixIcon: Icon(Icons.password),
                      ),
                      style: Theme.of(context).textTheme.titleMedium,
                      onChanged: (String value) {},
                      validator: (value) {
                        return value!.isEmpty ? 'Введите пароль' : null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: BlocBuilder<SignInCubit, SignInState>(
                      builder: (context, state) {
                        return switch (state) {
                          SignInInitial() => Builder(
                              builder: (context) {
                                return getButtonState(context, "", true);
                              },
                            ),
                          SignInLoading() => Builder(
                              builder: (context) {
                                return getButtonState(context, "", false);
                              },
                            ),
                          SignInException() || _ => Builder(
                              builder: (context) {
                                return getButtonState(
                                    context, "Авторизация провалилась", true);
                              },
                            ),
                        };
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
