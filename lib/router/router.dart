import 'package:app/features/presentation/ui/home/home.dart';
import 'package:app/features/presentation/ui/profile/profile.dart';
import 'package:app/features/presentation/ui/place_set/place_set.dart';
import 'package:app/features/presentation/ui/register/register.dart';
import 'package:app/features/presentation/ui/reserve_history/reserve_history.dart';
import 'package:app/features/presentation/ui/reserve_list/reserve_list.dart';
import 'package:app/features/presentation/ui/settings/settings.dart';
import 'package:app/features/presentation/ui/sign_in/sign_in.dart';
import 'package:app/features/presentation/ui/splash/splash.dart';
import 'package:app/router/guard/auth_guard.dart';
import 'package:auto_route/auto_route.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: "/",
          initial: true,
        ),
        AutoRoute(
          page: HomeRoute.page,
          guards: [AuthGuard()],
          path: "/home",
          children: [
            AutoRoute(
              page: ProfileRoute.page,
            ),
            AutoRoute(
              page: SettingsRoute.page,
            ),
            AutoRoute(
              page: ReserveListRoute.page,
            ),
            AutoRoute(
              page: ReserveHistoryRoute.page,
            ),
          ],
        ),
        AutoRoute(
          page: SignInRoute.page,
        ),
        AutoRoute(
          page: RegisterRoute.page,
        ),
        AutoRoute(
          page: PlaceSetRoute.page,
          guards: [AuthGuard()],
          path: "/place_set",
        ),
      ];
}
