import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken_admin/features/authentication/user_type.enum.dart';
import 'package:balatonivizeken_admin/features/users/list/providers/selected_user.provider.dart';
import 'package:balatonivizeken_admin/features/users/list/providers/user_list.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rustic/option.dart';

import '../../../shared/consts/colors.dart';
import '../../../shared/consts/screen_widths.dart';
import '../../../shared/router/router.dart';
import '../../../shared/widgets/error_widget.dart';
import '../../../shared/widgets/full_page_progress_indicator.dart';
import '../detail/user_details.screen.dart';
import 'models/user.header.dart';

@RoutePage()
class UserListScreen extends ConsumerStatefulWidget {
  const UserListScreen({super.key});

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends ConsumerState<UserListScreen> {
  @override
  void deactivate() {
    ref.read(userListProvider.notifier).cancelTimer();
    super.deactivate();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(userListProvider.notifier).refreshUsers();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userList = ref.watch(userListProvider);

    return userList.when(
      data: (data) => UsersView(userList: data),
      error: (error, stackTrace) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: NetworkErrorWidget(errorMessage: 'Probléma a betöltésnél'),
      ),
      loading: () => Stack(
        children: [
          if (userList.hasValue)
            UsersView(userList: userList.value!),
          if (!userList.hasValue)
            const SizedBox.shrink(),
          const FullPageProgressIndicator(),
        ],
      ),
    );
  }
}

class UsersView extends ConsumerWidget {
  const UsersView({super.key, required this.userList});

  final List<UserHeaderDto> userList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Lekérjük a kiválasztott hajót
    final selectedUser = ref.watch(selectedUserProvider);

    // A képernyő szélességének lekérése
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= BalatoniVizekenScreenWidths.expanded) {
      // Ha a képernyő szélesebb, egymás mellett mutatjuk a listát és a részleteket
      return Row(
        children: [
          Expanded(
            child: UserListView(
              userList: userList,
              onUserSelected: (user) {
                ref.read(selectedUserProvider.notifier).setSelectedUser(user);
              },
            ),
          ),
          Expanded(
            child: selectedUser == null ?
              const Center(
                child: Text('Válassz egy felhasználót a listából'),
              )
              : UserDetailsScreen(userId: selectedUser.id!),
          ),
        ],
      );
    } else {
      // Ha a képernyő keskenyebb, csak a lista jelenik meg
      return UserListView(
        userList: userList,
        onUserSelected: (user) {
          context.router.push(UserDetailsRoute(userId: selectedUser!.id!));
        },
      );
    }
  }
}

class UserListView extends StatelessWidget {
  const UserListView({
    super.key,
    required this.userList,
    required this.onUserSelected,
  });

  final List<UserHeaderDto> userList;
  final ValueChanged<UserHeaderDto> onUserSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Scrollbar(
        child: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            final item = userList[index];
            return Card(
              child: ListTile(
                tileColor: BalatoniVizekenColors.grey,
                title: Text(
                  item.username,
                  style: const TextStyle(
                    fontSize: 20.0, // Nagyobb betűméret
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  item.userType.displayName,
                  style: const TextStyle(fontSize: 16.0),
                ),
                onTap: () => onUserSelected(item),
              ),
            );
          },
        ),
      ),
    );
  }
}


