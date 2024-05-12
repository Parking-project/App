import 'package:app/features/domain/repository/auth_api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _repo;
  RegisterCubit(this._repo) : super(const RegisterInitial());

  void init() {}

  void register(String login, String password, String name) async {
    print("Login = ${login}, password = ${password}, name = ${name}");
    emit(const RegisterLoading());
    final result = await _repo.registration(login, password, name);
    result.fold(
      (l) => emit(const RegisterException()),
      (auth) {
        // auth
        emit(const RegisterInitial());
      },
    );
  }
}
