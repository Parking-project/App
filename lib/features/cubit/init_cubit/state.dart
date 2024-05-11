part of 'cubit.dart';

sealed class CounterState{
  final List<int> num;
  const CounterState({required this.num});
}
final class CounterInitial extends CounterState{
  const CounterInitial({required super.num});
}
final class CounterLoading extends CounterState{
  const CounterLoading({required super.num});
}
final class CounterException extends CounterState{
  const CounterException({required super.num});
}
final class CounterSuccess extends CounterState{
  const CounterSuccess({required super.num});
}