import 'package:app/router/router.dart';
import 'package:auto_route/auto_route.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    router.push(
      SignInRoute(
        onResult: (result) {
          if (result == true) {
            resolver.next(true);
            router.removeLast();
          }
        },
      ),
    );
  }
}
