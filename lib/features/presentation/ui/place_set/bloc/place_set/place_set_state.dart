part of 'place_set_cubit.dart';

@immutable
class PlaceSetState {
  const PlaceSetState();
}

final class PlaceSetInitial extends PlaceSetState {
  const PlaceSetInitial();
}

final class PlaceSetLoaded extends PlaceSetState {
  final List<PlaceEntity> places;
  const PlaceSetLoaded(this.places);
}

final class PlaceSetLoading extends PlaceSetState {
  final List<PlaceEntity> oldPlaces;
  final bool isFirstFetch;
  const PlaceSetLoading(this.oldPlaces, {this.isFirstFetch = false});
}
