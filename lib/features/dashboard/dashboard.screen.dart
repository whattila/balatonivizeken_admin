import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../shared/consts/colors.dart';
import '../../shared/navbar_tabs/navbar_tabs.dart';
import '../../shared/repositories/user_storage/providers/user_storage.provider.dart';
import '../../shared/router/router.dart';
import '../storm/storm_dialog.dart';

@RoutePage()
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  Widget _body(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        AutoTabsScaffold(
          resizeToAvoidBottomInset: false, //new line
          routes: navbarTabs.map((tab) => tab.route).toList(),
          backgroundColor: BalatoniVizekenColors.darkBlue,
          appBarBuilder: (context, tabsRouter) {
            return AppBar(
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.logout_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () => {
                    ref.read(userStorageProvider).clear(),
                    context.router.replaceAll([LoginRoute()]),
                  },
                ),
              ],
              //TODO change to icon later
              title: const Text(
                "Balatoni Vizeken - adminisztrátor",
              ),
              automaticallyImplyLeading: false,
            );
          },
          bottomNavigationBuilder: (context, tabsRouter) {
            return BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: (int index) {
                tabsRouter.setActiveIndex(index);
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: BalatoniVizekenColors.lightBlack,
              selectedItemColor: BalatoniVizekenColors.white,
              unselectedItemColor: BalatoniVizekenColors.lightGrey,
              items: navbarTabs.map((tab) => tab.bottomNavigationBarItem).toList(),
            );
          },
          floatingActionButton: FloatingActionButton.extended(
            tooltip: 'Viharjelzés küldése',
            foregroundColor: BalatoniVizekenColors.white,
            backgroundColor: BalatoniVizekenColors.red,
            hoverColor: BalatoniVizekenColors.lightRed,
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (BuildContext context) => const StormDialog(),
              );
            },
            label: const Text('Viharjelzés küldése')
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _body(context, ref);
  }
}