part of 'user_cubit.dart';

@immutable
class UserState {
  final UserEntity? userData;
  const UserState({required this.userData});
}
final class UserInitial extends UserState{
  const UserInitial({required super.userData});
}
final class UserLoading extends UserState{
  const UserLoading({required super.userData});
}
final class UserException extends UserState{
  const UserException({required super.userData});
}
final class UserSuccess extends UserState{
  const UserSuccess({required super.userData});
}