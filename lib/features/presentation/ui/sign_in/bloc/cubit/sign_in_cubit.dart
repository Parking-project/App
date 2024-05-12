import 'package:app/features/domain/repository/auth_api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository _repo;
  SignInCubit(this._repo) : super(const SignInInitial(message: ""));

  void init() {}

  void login(String login, String password) async {
    print("Login = ${login}, password = ${password}");
    emit(const SignInLoading());
    final result = await _repo.signIn(login, password);
    result.fold(
      (l) {
        emit(const SignInException());
      },
      (auth) {
        emit(const SignInInitial());
      },
    );
  }
}
