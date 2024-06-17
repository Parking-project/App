// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeScreen(),
      );
    },
    PlaceSetRoute.name: (routeData) {
      final args = routeData.argsAs<PlaceSetRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PlaceSetScreen(args.reserveID),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfileScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegisterScreen(),
      );
    },
    ReserveAddRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReserveAddScreen(),
      );
    },
    ReserveHistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReserveHistoryScreen(),
      );
    },
    ReserveListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReserveListScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsScreen(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignInScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlaceSetScreen]
class PlaceSetRoute extends PageRouteInfo<PlaceSetRouteArgs> {
  PlaceSetRoute({
    required String? reserveID,
    List<PageRouteInfo>? children,
  }) : super(
          PlaceSetRoute.name,
          args: PlaceSetRouteArgs(reserveID: reserveID),
          initialChildren: children,
        );

  static const String name = 'PlaceSetRoute';

  static const PageInfo<PlaceSetRouteArgs> page =
      PageInfo<PlaceSetRouteArgs>(name);
}

class PlaceSetRouteArgs {
  const PlaceSetRouteArgs({required this.reserveID});

  final String? reserveID;

  @override
  String toString() {
    return 'PlaceSetRouteArgs{reserveID: $reserveID}';
  }
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReserveAddScreen]
class ReserveAddRoute extends PageRouteInfo<void> {
  const ReserveAddRoute({List<PageRouteInfo>? children})
      : super(
          ReserveAddRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReserveAddRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReserveHistoryScreen]
class ReserveHistoryRoute extends PageRouteInfo<void> {
  const ReserveHistoryRoute({List<PageRouteInfo>? children})
      : super(
          ReserveHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReserveHistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReserveListScreen]
class ReserveListRoute extends PageRouteInfo<void> {
  const ReserveListRoute({List<PageRouteInfo>? children})
      : super(
          ReserveListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReserveListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInScreen]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
