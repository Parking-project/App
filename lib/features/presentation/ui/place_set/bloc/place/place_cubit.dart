import 'package:app/features/domain/entity/user_api_entity.dart';
import 'package:app/features/domain/repository/user_api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'place_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _repo;
  UserCubit(this._repo) : super(const UserInitial(userData: null));

  void init() {
  }
  
  void load() async {
    final result = await _repo.getUser();
    result.fold((l) => emit(const UserException(userData: null)),
        (user) => emit(UserSuccess(userData: user)));
  }

  Future<void> reload() async{
    emit(const UserLoading(userData: null));
    load();
  }

  UserEntity get user => state.userData?? UserEntity(displayName: "None", login: "None");
}
