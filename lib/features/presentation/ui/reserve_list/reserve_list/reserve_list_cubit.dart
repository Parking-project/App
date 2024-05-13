import 'package:app/features/domain/entity/reserve_api_entity.dart';
import 'package:app/features/domain/repository/reserve_api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'reserve_list_state.dart';

class ReserveListCubit extends Cubit<ReserveListState> {
  ReserveListCubit(this._repo) : super(const ReserveListInitial());

  int currentPage = 0;
  int reserveState = 2;
  final ReserveRepository _repo;

  void setReserveState(int reserveState){
    currentPage = 0;
    this.reserveState = reserveState;
    emit(const ReserveListInitial());
    getReserve();
  }

  void getReserve() {
    if (state is ReserveListLoading) return;

    final currentState = state;

    var oldReserves = <ReserveEntity>[];
    if (currentState is ReserveListLoaded) {
      oldReserves = currentState.reserves;
    }

    emit(ReserveListLoading(oldReserves, isFirstFetch: currentPage == 0));

    _repo.getPage([reserveState], currentPage).then((response) {
      currentPage += 1;

      final reserves = (state as ReserveListLoading).oldReserves;
      response.fold(
        (l) => null,
        (r) {
          reserves.addAll(r);
        },
      );

      emit(ReserveListLoaded(reserves));
    });
  }
}
