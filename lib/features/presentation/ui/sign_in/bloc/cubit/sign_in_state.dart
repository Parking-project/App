part of 'sign_in_cubit.dart';

@immutable
class SignInState {
  const SignInState();
}

class SignInInitial extends SignInState {
  const SignInInitial();
}

class SignInLoading extends SignInState {
  const SignInLoading();
}

class SignInException extends SignInState {
  const SignInException();
}

class SignInSuccess extends SignInState {
  const SignInSuccess();
}