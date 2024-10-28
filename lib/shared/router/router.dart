import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/authentication/login/login.screen.dart';
import '../../features/authentication/register/register.screen.dart';
import '../../features/boat/detail/boat_details_screen.dart';
import '../../features/boat/list/boat_list.screen.dart';
import '../../features/boat/list/models/boat.header.dart';
import '../../features/dashboard/dashboard.screen.dart';
import '../../features/forgot_password/forgot_password.screen.dart';
import '../../features/no_go_zone/no_go_zone.screen.dart';
import '../../features/users/detail/user_details.screen.dart';
import '../../features/users/list/models/user.header.dart';
import '../../features/users/list/user_list.screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/login',
      page: LoginRoute.page,
      initial: true
    ),
    AutoRoute(
      path: '/register',
      page: RegisterRoute.page
    ),
    AutoRoute(
      path: '/forgot_password',
      page: ForgotPasswordRoute.page
    ),
    AutoRoute(
      path: '/dashboard',
      page: DashboardRoute.page,
      children: [
        AutoRoute(path: 'users', page: UserListRoute.page),
        AutoRoute(path: 'boats', page: BoatListRoute.page),
        AutoRoute(path: 'no_go_zones', page: NoGoZoneRoute.page)
      ]
    ),
    AutoRoute(
      path: '/user_details',
      page: UserDetailsRoute.page
    ),
    AutoRoute(
        path: '/boat_details',
        page: BoatDetailsRoute.page
    ),
  ];
}