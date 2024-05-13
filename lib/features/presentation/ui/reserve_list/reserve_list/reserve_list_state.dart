part of 'reserve_list_cubit.dart';

@immutable
class ReserveListState {
  final List<ReserveEntity> reserveData;
  final int pageIndex;
  final int reserveState;
  const ReserveListState({
    required this.reserveData,
    required this.pageIndex,
    required this.reserveState,
  });
}

final class ReserveListInitial extends ReserveListState {
  const ReserveListInitial({
    required super.reserveData,
    required super.pageIndex,
    required super.reserveState,
  });
}

final class ReserveListLoading extends ReserveListState {
  const ReserveListLoading({
    required super.reserveData,
    required super.pageIndex,
    required super.reserveState,
  });
}

final class ReserveListException extends ReserveListState {
  const ReserveListException({
    required super.reserveData,
    required super.pageIndex,
    required super.reserveState,
  });
}

final class ReserveListSuccess extends ReserveListState {
  const ReserveListSuccess({
    required super.reserveData,
    required super.pageIndex,
    required super.reserveState,
  });
}
