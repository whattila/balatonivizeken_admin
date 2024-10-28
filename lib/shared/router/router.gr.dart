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
    BoatDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BoatDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BoatDetailsScreen(
          boatHeader: args.boatHeader,
          key: args.key,
        ),
      );
    },
    BoatListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BoatListScreen(),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordRouteArgs>(
          orElse: () => const ForgotPasswordRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ForgotPasswordScreen(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginScreen(key: args.key),
      );
    },
    NoGoZoneRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NoGoZoneScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterScreen(),
      );
    },
    UserDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<UserDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UserDetailsScreen(
          userId: args.userId,
          key: args.key,
        ),
      );
    },
    UserListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserListScreen(),
      );
    },
  };
}

/// generated route for
/// [BoatDetailsScreen]
class BoatDetailsRoute extends PageRouteInfo<BoatDetailsRouteArgs> {
  BoatDetailsRoute({
    required BoatHeaderDto boatHeader,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          BoatDetailsRoute.name,
          args: BoatDetailsRouteArgs(
            boatHeader: boatHeader,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'BoatDetailsRoute';

  static const PageInfo<BoatDetailsRouteArgs> page =
      PageInfo<BoatDetailsRouteArgs>(name);
}

class BoatDetailsRouteArgs {
  const BoatDetailsRouteArgs({
    required this.boatHeader,
    this.key,
  });

  final BoatHeaderDto boatHeader;

  final Key? key;

  @override
  String toString() {
    return 'BoatDetailsRouteArgs{boatHeader: $boatHeader, key: $key}';
  }
}

/// generated route for
/// [BoatListScreen]
class BoatListRoute extends PageRouteInfo<void> {
  const BoatListRoute({List<PageRouteInfo>? children})
      : super(
          BoatListRoute.name,
          initialChildren: children,
        );

  static const String name = 'BoatListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForgotPasswordScreen]
class ForgotPasswordRoute extends PageRouteInfo<ForgotPasswordRouteArgs> {
  ForgotPasswordRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ForgotPasswordRoute.name,
          args: ForgotPasswordRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const PageInfo<ForgotPasswordRouteArgs> page =
      PageInfo<ForgotPasswordRouteArgs>(name);
}

class ForgotPasswordRouteArgs {
  const ForgotPasswordRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ForgotPasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [NoGoZoneScreen]
class NoGoZoneRoute extends PageRouteInfo<void> {
  const NoGoZoneRoute({List<PageRouteInfo>? children})
      : super(
          NoGoZoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoGoZoneRoute';

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
/// [UserDetailsScreen]
class UserDetailsRoute extends PageRouteInfo<UserDetailsRouteArgs> {
  UserDetailsRoute({
    required String userId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          UserDetailsRoute.name,
          args: UserDetailsRouteArgs(
            userId: userId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'UserDetailsRoute';

  static const PageInfo<UserDetailsRouteArgs> page =
      PageInfo<UserDetailsRouteArgs>(name);
}

class UserDetailsRouteArgs {
  const UserDetailsRouteArgs({
    required this.userId,
    this.key,
  });

  final String userId;

  final Key? key;

  @override
  String toString() {
    return 'UserDetailsRouteArgs{userId: $userId, key: $key}';
  }
}

/// generated route for
/// [UserListScreen]
class UserListRoute extends PageRouteInfo<void> {
  const UserListRoute({List<PageRouteInfo>? children})
      : super(
          UserListRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
