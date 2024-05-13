import 'package:app/core/get_storage_keys.dart';
import 'package:app/di/service.dart';
import 'package:app/features/domain/repository/auth_api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _repo;
  RegisterCubit(this._repo) : super(const RegisterInitial());

  void init() {
    emit(const RegisterInitial());
  }

  void register(String login, String password, String name) async {
    emit(const RegisterLoading());
    SharedPreferences pref = service<SharedPreferences>();
    final result = await _repo.registration(login, password, name);
    result.fold(
      (l) async {
        await pref.clear();
        emit(const RegisterException());
      },
      (auth) async {
        await pref.setBool(GetStorageKeys.loggedIn, true);
        await pref.setString(GetStorageKeys.accessToken, auth.access);
        await pref.setString(GetStorageKeys.refreshToken, auth.refresh);
        emit(const RegisterSuccess());
      },
    );
  }
}
