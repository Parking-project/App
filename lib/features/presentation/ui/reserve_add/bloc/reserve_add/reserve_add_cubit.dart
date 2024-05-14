import 'package:app/features/domain/repository/reserve_api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'reserve_add_state.dart';

class ReserveAddCubit extends Cubit<ReserveAddState> {
  final ReserveRepository _repo;
  ReserveAddCubit(this._repo) : super(const ReserveAddInitial());

  void init() {
    emit(const ReserveAddInitial());
  }

  void addReserve(int begin, int end) async {
    emit(const ReserveAddLoading());
    final result = await _repo.addReserve(begin, end);
    result.fold(
      (l) async {
        emit(const ReserveAddException());
      },
      (auth) async {
        emit(const ReserveAddSuccess());
      },
    );
  }
}
