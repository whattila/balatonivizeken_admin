import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../router/router.dart';

class NavbarTabs {
  final PageRouteInfo<dynamic> route;
  final BottomNavigationBarItem bottomNavigationBarItem;

  NavbarTabs({required this.route, required this.bottomNavigationBarItem});
}

final List<NavbarTabs> navbarTabs = [
  NavbarTabs(
    route: const UserListRoute(),
    bottomNavigationBarItem: const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Felhasználók'),
  ),
  NavbarTabs(
    route: const BoatListRoute(),
    bottomNavigationBarItem: const BottomNavigationBarItem(icon: Icon(Icons.directions_boat), label: 'Hajók')
  )
];