import 'package:app/di/service.dart';
import 'package:app/features/domain/repository/auth_api_repository.dart';
import 'package:app/features/domain/repository/tokens_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository _repo;
  final TokensRepository _tokensRepo;
  SignInCubit(this._repo, this._tokensRepo) : super(const SignInInitial());

  void init() {
    emit(const SignInInitial());
  }

  void login(String login, String password) async {
    emit(const SignInLoading());
    SharedPreferences pref = service<SharedPreferences>();
    final result = await _repo.signIn(login, password);
    result.fold(
      (l) async {
        await pref.clear();
        emit(const SignInException());
      },
      (auth) async {
        if (auth.roleName != "USER") {
          await _tokensRepo.logOut();
          emit(const SignInException());
          return;
        }
        
        emit(const SignInSuccess());
        await _tokensRepo.setTokens(auth.access, auth.refresh);
      },
    );
  }
}
