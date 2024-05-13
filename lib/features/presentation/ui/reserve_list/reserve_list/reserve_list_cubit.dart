import 'package:app/features/data/repository/reserve_api_repository_impl.dart';
import 'package:app/features/domain/entity/reserve_api_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'reserve_list_state.dart';

class ReserveListCubit extends Cubit<ReserveListState> {
  final ReserveRepositoryImpl _repo;
  ReserveListCubit(this._repo)
      : super(const ReserveListInitial(
          reserveData: [],
          pageIndex: 0,
          reserveState: 2,
        ));

  void init() async {
    emit(const ReserveListInitial(
      reserveData: [],
      pageIndex: 0,
      reserveState: 2,
    ));
  }

  void load(int pageIndex, int reserveState) async {
    if (pageIndex < 1) {
      pageIndex = 1;
    }
    pageIndex -= 1;
    if (reserveState < 1 || reserveState > 4) {
      reserveState = 1;
    }
    emit(ReserveListLoading(
      reserveData: state.reserveData,
      pageIndex: state.pageIndex,
      reserveState: state.reserveState,
    ));
    final result = await _repo.getPage(state.reserveState, pageIndex);
    result.fold(
      (l) {
        emit(ReserveListException(
          reserveData: state.reserveData,
          pageIndex: state.pageIndex,
          reserveState: state.reserveState,
        ));
      },
      (r) {
        emit(ReserveListInitial(
          reserveData: r,
          pageIndex: pageIndex,
          reserveState: state.reserveState,
        ));
      },
    );
  }

  List<ReserveEntity> get getReserves => state.reserveData;
}
