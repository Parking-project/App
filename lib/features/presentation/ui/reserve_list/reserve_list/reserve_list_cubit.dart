import 'package:app/features/domain/entity/reserve_api_entity.dart';
import 'package:app/features/domain/repository/reserve_api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'reserve_list_state.dart';

class ReserveListCubit extends Cubit<ReserveListState> {
  ReserveListCubit(this._repo) : super(const ReserveListInitial());

  final ReserveRepository _repo;

  void updateReserves() {
    final currentState = state;
    if (currentState is ReserveListLoaded) {
      List<ReserveEntity> oldReserves = currentState.reserves;

      int page_size = 10 * currentPage;
      _repo.getPage([reserveState], 0, page_size).then(
        (response) {
          response.fold(
            (l) => null,
            (r) {
              emit(const ReserveListInitial());
              emit(ReserveListLoaded(r));
            },
          );
        },
      );
    }
  }

  void addReserve(int begin, int end) {
    final currentState = state;
    if (currentState is ReserveListLoaded) {
      List<ReserveEntity> oldReserves = currentState.reserves;

      _repo.addReserve(begin, end).then(
        (response) {
          response.fold(
            (l) => null,
            (r) {
              updateReserves();
            },
          );
        },
      );
    }
  }

  void deleteReserve(int index) {
    final currentState = state;
    if (currentState is ReserveListLoaded) {
      List<ReserveEntity> oldReserves = currentState.reserves;

      _repo.deleteReserve(oldReserves.elementAt(index).ID).then(
        (response) {
          response.fold(
            (l) => null,
            (r) {
              updateReserves();
            },
          );
        },
      );
    }
  }

  int currentPage = 0;
  int reserveState = 2;

  void setReserveState(int reserveState) {
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

    _repo.getPage([reserveState], currentPage, 10).then((response) {
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
