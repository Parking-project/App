part of 'sign_in_cubit.dart';

@immutable
class SignInState {
  final String message;
  const SignInState({required this.message});
}

class SignInInitial extends SignInState {
  const SignInInitial({super.message=""});
}

class SignInLoading extends SignInState {
  const SignInLoading({super.message=""});
}

class SignInException extends SignInState {
  const SignInException({required super.message});
}