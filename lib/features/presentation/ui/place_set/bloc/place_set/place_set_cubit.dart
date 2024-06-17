import 'package:app/features/domain/entity/place_api_entity.dart';
import 'package:app/features/domain/repository/place_api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'place_set_state.dart';

class PlaceSetCubit extends Cubit<PlaceSetState> {
  PlaceSetCubit(this._repo) : super(const PlaceSetInitial());

  void init(String reserve_id) {
    emit(const PlaceSetLoaded([]));
    getReserve(reserve_id);
  }

  int currentPage = 0;
  final PlaceRepository _repo;

  void setReserveState(String reserveID) {
    currentPage = 0;
    emit(const PlaceSetInitial());
    getReserve(reserveID);
  }

  void getReserve(String reserveID) {
    if (state is PlaceSetLoading) return;

    final currentState = state;

    var oldPlaces = <PlaceEntity>[];
    if (currentState is PlaceSetLoaded) {
      oldPlaces = currentState.places;
    }

    emit(PlaceSetLoading(oldPlaces, isFirstFetch: currentPage == 0));

    _repo.getPage(reserveID, currentPage, 10).then((response) {
      currentPage += 1;

      final places = (state as PlaceSetLoading).oldPlaces;
      response.fold(
        (l) => null,
        (r) {
          places.addAll(r);
        },
      );

      emit(PlaceSetLoaded(places));
    });
  }
}
