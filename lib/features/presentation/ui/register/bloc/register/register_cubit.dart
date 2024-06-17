import 'package:app/features/domain/repository/auth_api_repository.dart';
import 'package:app/features/domain/repository/tokens_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _repo;
  final TokensRepository _tokensRepo;
  RegisterCubit(this._repo, this._tokensRepo) : super(const RegisterInitial());

  void init() {
    emit(const RegisterInitial());
  }

  void register(String login, String password, String name) async {
    emit(const RegisterLoading());
    final result = await _repo.registration(login, password, name);
    result.fold(
      (l) async {
        await _tokensRepo.logOut();
        emit(const RegisterException());
      },
      (auth) async {
        await _tokensRepo.setTokens(auth.access, auth.refresh);
        emit(const RegisterSuccess());
      },
    );
  }
}
