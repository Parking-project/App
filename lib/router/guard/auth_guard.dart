import 'package:app/core/get_storage_keys.dart';
import 'package:app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool loggedIn = pref.getBool(GetStorageKeys.loggedIn) ?? false;
    if (loggedIn){
      resolver.next(true);
    }
    else{
      router.push(const SignInRoute());
    }
    
    // if (isAuthorized){
    //   resolver.next(true);
    // }
    // else{
    //   resolver.redirect(const SignInRoute());
    // }
    // router.push(
    //   SignInRoute(
    //     onResult: (result) {
    //       if (result == true) {
    //         resolver.next(true);
    //         router.removeLast();
    //       }
    //     },
    //   ),
    // );
  }
}
