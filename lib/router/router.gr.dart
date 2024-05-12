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
    PasswordChangeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PasswordChangeScreen(),
      );
    },
    PlaceHistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlaceHistoryScreen(),
      );
    },
    PlaceListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlaceListScreen(),
      );
    },
    PlaceSetRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlaceSetScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfileScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegisterScreen(onResult: args.onResult),
      );
    },
    ReserveHistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReserveHistoryScreen(),
      );
    },
    ReserveListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReserveListScreen(),
      );
    },
    ReserveRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReserveScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignInScreen(onResult: args.onResult),
      );
    },
    SupportChatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SupportChatScreen(),
      );
    },
    SupportRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SupportScreen(),
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
/// [PasswordChangeScreen]
class PasswordChangeRoute extends PageRouteInfo<void> {
  const PasswordChangeRoute({List<PageRouteInfo>? children})
      : super(
          PasswordChangeRoute.name,
          initialChildren: children,
        );

  static const String name = 'PasswordChangeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlaceHistoryScreen]
class PlaceHistoryRoute extends PageRouteInfo<void> {
  const PlaceHistoryRoute({List<PageRouteInfo>? children})
      : super(
          PlaceHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlaceHistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlaceListScreen]
class PlaceListRoute extends PageRouteInfo<void> {
  const PlaceListRoute({List<PageRouteInfo>? children})
      : super(
          PlaceListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlaceListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlaceSetScreen]
class PlaceSetRoute extends PageRouteInfo<void> {
  const PlaceSetRoute({List<PageRouteInfo>? children})
      : super(
          PlaceSetRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlaceSetRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
class RegisterRoute extends PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    required dynamic Function(bool?) onResult,
    List<PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(onResult: onResult),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<RegisterRouteArgs> page =
      PageInfo<RegisterRouteArgs>(name);
}

class RegisterRouteArgs {
  const RegisterRouteArgs({required this.onResult});

  final dynamic Function(bool?) onResult;

  @override
  String toString() {
    return 'RegisterRouteArgs{onResult: $onResult}';
  }
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
/// [ReserveScreen]
class ReserveRoute extends PageRouteInfo<void> {
  const ReserveRoute({List<PageRouteInfo>? children})
      : super(
          ReserveRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReserveRoute';

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
class SignInRoute extends PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    required dynamic Function(bool?) onResult,
    List<PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          args: SignInRouteArgs(onResult: onResult),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<SignInRouteArgs> page = PageInfo<SignInRouteArgs>(name);
}

class SignInRouteArgs {
  const SignInRouteArgs({required this.onResult});

  final dynamic Function(bool?) onResult;

  @override
  String toString() {
    return 'SignInRouteArgs{onResult: $onResult}';
  }
}

/// generated route for
/// [SupportChatScreen]
class SupportChatRoute extends PageRouteInfo<void> {
  const SupportChatRoute({List<PageRouteInfo>? children})
      : super(
          SupportChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'SupportChatRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SupportScreen]
class SupportRoute extends PageRouteInfo<void> {
  const SupportRoute({List<PageRouteInfo>? children})
      : super(
          SupportRoute.name,
          initialChildren: children,
        );

  static const String name = 'SupportRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
