import 'package:app/features/presentation/ui/register/bloc/register/register_cubit.dart';
import 'package:app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class RegisterScreen extends StatelessWidget {
  RegisterScreen();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reapetPasswordController = TextEditingController();

  Widget getButtonState(BuildContext context, String message, bool isButton) {
    if (isButton) {
      return Column(
        children: [
          FilledButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<RegisterCubit>().register(
                      loginController.text,
                      passwordController.text,
                      nameController.text,
                    );
              }
            },
            child: Text(
              "Зарегистрироваться",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          MaterialButton(
            onPressed: () {
              context.router.push(
                const SignInRoute(),
              );
            },
            child: Text(
              "Авторизация",
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
          "Окно регистрации",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Регистрации",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 35),
            child: Form(
              key: _formKey,
              child: BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 95,
                        child: TextFormField(
                          enabled: state is RegisterInitial || state is RegisterException,
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
                          enabled: state is RegisterInitial || state is RegisterException,
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            labelText: "Имя",
                            hintText: "Введите свое имя",
                            prefixIcon: Icon(Icons.password),
                          ),
                          style: Theme.of(context).textTheme.titleMedium,
                          onChanged: (String value) {},
                          validator: (value) {
                            return value!.isEmpty ? 'Введите имя' : null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 95,
                        child: TextFormField(
                          enabled: state is RegisterInitial || state is RegisterException,
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
                      SizedBox(
                        height: 95,
                        child: TextFormField(
                          enabled: state is RegisterInitial || state is RegisterException,
                          controller: reapetPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: const InputDecoration(
                            labelText: "Проверка пароль",
                            hintText: "Введите пароль снова",
                            prefixIcon: Icon(Icons.password),
                          ),
                          style: Theme.of(context).textTheme.titleMedium,
                          onChanged: (String value) {},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Введите пароль';
                            }
                            if (value != passwordController.text) {
                              return 'Пароль не совпадает';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: switch (state) {
                          RegisterInitial() => Builder(
                              builder: (context) {
                                return getButtonState(context, "", true);
                              },
                            ),
                          RegisterLoading() => Builder(
                              builder: (context) {
                                return getButtonState(context, "", false);
                              },
                            ),
                          RegisterSuccess() => Builder(
                              builder: (context) {
                                loginController.text = "";
                                passwordController.text = "";
                                nameController.text = "";
                                reapetPasswordController.text = "";
                                context.router.push(const ProfileRoute());
                                context.read<RegisterCubit>().init();
                                return getButtonState(context, "", true);
                              },
                            ),
                          RegisterException() || _ => Builder(
                              builder: (context) {
                                return getButtonState(context,
                                    "Регистрация провалилась", true);
                              },
                            ),
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
