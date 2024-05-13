part of 'reserve_list_cubit.dart';

@immutable
class ReserveListState {
  const ReserveListState();
}

final class ReserveListInitial extends ReserveListState {
  const ReserveListInitial();
}

final class ReserveListLoaded extends ReserveListState {
  final List<ReserveEntity> reserves;
  const ReserveListLoaded(this.reserves);
}

final class ReserveListLoading extends ReserveListState {
  final List<ReserveEntity> oldReserves;
  final bool isFirstFetch;
  const ReserveListLoading(this.oldReserves, {this.isFirstFetch = false});
}
