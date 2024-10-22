import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken_admin/features/users/list/providers/user_list.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rustic/option.dart';

import '../../../shared/consts/colors.dart';
import '../../../shared/router/router.dart';
import '../../../shared/widgets/error_widget.dart';
import '../../../shared/widgets/full_page_progress_indicator.dart';
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
      data: (data) => UserListView(userList: data),
      error: (error, stackTrace) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: NetworkErrorWidget(errorMessage: 'Probléma a betöltésnél'),
      ),
      loading: () => Stack(
        children: [
          if (userList.hasValue)
            UserListView(userList: userList.value!),
          if (!userList.hasValue)
            const SizedBox.shrink(),
          const FullPageProgressIndicator(),
        ],
      ),
    );
  }
}

class UserListView extends StatelessWidget {
  const UserListView({super.key, required this.userList});

  final List<UserHeaderDto> userList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Scrollbar(
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
                      item.userType.toString(),
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    onTap: () => context.router.push(UserDetailsRoute(userId: item.id!)),
                  ),
                );
              },
            ),
          ),
          const UserRefreshButton(),
        ],
      ),
    );
  }
}

class UserRefreshButton extends ConsumerWidget {
  const UserRefreshButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      bottom: 10,
      right: 10,
      child: ElevatedButton(
        onPressed: () {
          ref.read(userListProvider.notifier).refreshUsers();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: BalatoniVizekenColors.lightBlue,
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
        ),
        child: const Text('FRISSÍTÉS'),
      ),
    );
  }
}


