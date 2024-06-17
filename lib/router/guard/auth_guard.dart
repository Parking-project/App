import 'package:app/di/service.dart';
import 'package:app/features/domain/repository/tokens_repository.dart';
import 'package:app/router/router.dart';
import 'package:auto_route/auto_route.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async{
    TokensRepository tokensRepository = service<TokensRepository>();
    if (tokensRepository.getIsAuthorize()){
      resolver.next(true);
    }
    else{
      router.push(const SignInRoute());
    }
  }
}
