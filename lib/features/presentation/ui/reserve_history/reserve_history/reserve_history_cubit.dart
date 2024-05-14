import 'package:app/features/domain/entity/reserve_api_entity.dart';
import 'package:app/features/domain/repository/reserve_api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'reserve_history_state.dart';

class ReserveHistoryCubit extends Cubit<ReserveHistoryState> {
  ReserveHistoryCubit(this._repo) : super(const ReserveHistoryInitial());

  int currentPage = 0;
  final ReserveRepository _repo;

  void setReserveState(int reserveState){
    currentPage = 0;
    emit(const ReserveHistoryInitial());
    getReserve();
  }

  void getReserve() {
    if (state is ReserveHistoryLoading) return;

    final currentState = state;

    var oldReserves = <ReserveEntity>[];
    if (currentState is ReserveHistoryLoaded) {
      oldReserves = currentState.reserves;
    }

    emit(ReserveHistoryLoading(oldReserves, isFirstFetch: currentPage == 0));

    _repo.getPage([1,2,3,4], currentPage, 10).then((response) {
      currentPage += 1;

      final reserves = (state as ReserveHistoryLoading).oldReserves;
      response.fold(
        (l) => null,
        (r) {
          reserves.addAll(r);
        },
      );

      emit(ReserveHistoryLoaded(reserves));
    });
  }
}
