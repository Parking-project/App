part of 'tokens_cubit.dart';

class TokensState extends Equatable {
  const TokensState(this.access, this.refresh);

  final String access;
  final String refresh;
  String get getAccess => access;
  String get getRefresh => refresh;

  @override
  List<Object> get props => [access, refresh];
}