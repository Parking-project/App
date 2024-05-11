import 'package:app/features/presentation/ui/home/home.dart';
import 'package:app/features/presentation/ui/password_change/password_change.dart';
import 'package:app/features/presentation/ui/place_history/place_history.dart';
import 'package:app/features/presentation/ui/place_list/place_list.dart';
import 'package:app/features/presentation/ui/place_set/place_set.dart';
import 'package:app/features/presentation/ui/register/register.dart';
import 'package:app/features/presentation/ui/reserve/reserve.dart';
import 'package:app/features/presentation/ui/reserve_history/reserve_history.dart';
import 'package:app/features/presentation/ui/reserve_list/reserve_list.dart';
import 'package:app/features/presentation/ui/settings/settings.dart';
import 'package:app/features/presentation/ui/sign_in/sign_in.dart';
import 'package:app/features/presentation/ui/splash/splash.dart';
import 'package:app/features/presentation/ui/support/support.dart';
import 'package:app/features/presentation/ui/support_chat/support_chat.dart';
import 'package:auto_route/auto_route.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: "/",
        ),
        AutoRoute(
          page: SignInRoute.page,
        ),
        AutoRoute(
          page: RegisterRoute.page,
        ),
        AutoRoute(
          page: HomeRoute.page,
          children: [
            AutoRoute(
              page: PasswordChangeRoute.page,
            ),
          ],
        ),
        
        AutoRoute(
          page: SettingsRoute.page,
          children: [
            AutoRoute(
              page: SupportRoute.page,
              children: [
                AutoRoute(
                  page: SupportChatRoute.page,
                ),
              ],
            ),
          ],
        ),
        
        AutoRoute(
          page: ReserveListRoute.page,
          children: [
            AutoRoute(
              page: ReserveRoute.page,
              children: [
                AutoRoute(
                  page: PlaceSetRoute.page
                ),
              ],
            ),
          ],
        ),
        AutoRoute(
          page: ReserveHistoryRoute.page,
        ),
      ];
}
