import 'package:app/features/domain/repository/tokens_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tokens_state.dart';

class TokensCubit extends Cubit<TokensState> {
  TokensCubit({
    required TokensRepositoryInterface tokensRepository,
  })  : _tokensRepository = tokensRepository,
        super(const TokensState("", "")){
          _heckTokens();
        }

  final TokensRepositoryInterface _tokensRepository;

  Future<void> setTokens(String access, String refresh) async {
    emit(TokensState(access, refresh));
    _tokensRepository.setTokens(access, refresh);
  }

  void _heckTokens() {
    final access = _tokensRepository.getAccessToken();
    final refresh = _tokensRepository.getRefreshToken();
    emit(TokensState(access, refresh));
  }
}
