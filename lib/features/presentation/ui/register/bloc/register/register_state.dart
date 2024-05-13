part of 'register_cubit.dart';

@immutable
class RegisterState {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  const RegisterInitial();
}

class RegisterLoading extends RegisterState {
  const RegisterLoading();
}

class RegisterException extends RegisterState {
  const RegisterException();
}

class RegisterSuccess extends RegisterState {
  const RegisterSuccess();
}