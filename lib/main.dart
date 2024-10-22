import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken_admin/shared/consts/colors.dart';
import 'package:balatonivizeken_admin/shared/consts/global_key.dart';
import 'package:balatonivizeken_admin/shared/router/router.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: BalatonivizekenAdminApp(),
    ),
  );
}

class BalatonivizekenAdminApp extends ConsumerWidget {
  const BalatonivizekenAdminApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider); // ref használata az állapotból

    return MaterialApp.router(
      scaffoldMessengerKey: globalKey,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(backgroundColor: BalatoniVizekenColors.lightBlack),
        brightness: Brightness.dark,
        listTileTheme: ListTileThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
        primaryColor: const Color(0xff0d6efd),
        scaffoldBackgroundColor: BalatoniVizekenColors.darkBlue,
        cardColor: BalatoniVizekenColors.lightBlack,
        drawerTheme: const DrawerThemeData(backgroundColor: BalatoniVizekenColors.lightBlack),
        dialogBackgroundColor: BalatoniVizekenColors.lightBlack,
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: BalatoniVizekenColors.lightBlack,
          contentTextStyle: TextStyle(color: Colors.white),
          shape: StadiumBorder(),
        ),
      ),
      key: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Balatoni Vizeken',
      routerDelegate: AutoRouterDelegate(router, navigatorObservers: () => [AutoRouteObserver()]),
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}
