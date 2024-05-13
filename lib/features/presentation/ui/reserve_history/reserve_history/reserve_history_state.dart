part of 'reserve_history_cubit.dart';

@immutable
class ReserveHistoryState {
  const ReserveHistoryState();
}

final class ReserveHistoryInitial extends ReserveHistoryState {
  const ReserveHistoryInitial();
}

final class ReserveHistoryLoaded extends ReserveHistoryState {
  final List<ReserveEntity> reserves;
  const ReserveHistoryLoaded(this.reserves);
}

final class ReserveHistoryLoading extends ReserveHistoryState {
  final List<ReserveEntity> oldReserves;
  final bool isFirstFetch;
  const ReserveHistoryLoading(this.oldReserves, {this.isFirstFetch = false});
}
