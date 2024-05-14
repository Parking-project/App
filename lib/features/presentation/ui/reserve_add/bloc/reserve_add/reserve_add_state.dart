part of 'reserve_add_cubit.dart';

@immutable
class ReserveAddState {
  const ReserveAddState();
}

class ReserveAddInitial extends ReserveAddState {
  const ReserveAddInitial();
}

class ReserveAddLoading extends ReserveAddState {
  const ReserveAddLoading();
}

class ReserveAddException extends ReserveAddState {
  const ReserveAddException();
}

class ReserveAddSuccess extends ReserveAddState {
  const ReserveAddSuccess();
}