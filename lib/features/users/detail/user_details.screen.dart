import 'package:auto_route/annotations.dart';
import 'package:balatonivizeken_admin/features/users/detail/providers/user_info.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/error_widget.dart';
import '../../../shared/widgets/full_page_progress_indicator.dart';
import '../../../shared/widgets/unattached_screens_wrapper.dart';
import '../list/models/user.header.dart';
import 'models/user_info.model.dart';

@RoutePage()
class UserDetailsScreen extends ConsumerWidget {
  const UserDetailsScreen({required this.userId, super.key});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userByIdProvider(id: userId));

    return UnattachedScreensWrapper(
      isLoading: false,
      canPop: true,
      content: userInfo.when(
        data: (user) => UserDetailsBody(user: user),
        loading: () => const FullPageProgressIndicator(),
        error: (error, stackTrace) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: NetworkErrorWidget(errorMessage: 'Probléma a betöltésnél',),
        ),
      ),
    );
  }
}

class UserDetailsBody extends StatelessWidget {
  const UserDetailsBody({required this.user, super.key});

  final UserInfoDto user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Balra igazított szövegek
      children: [
        const Center(
          child: Text(
            'Felhasználó Részletek', // Középen megjelenő cím
            style: TextStyle(
              fontSize: 24.0, // Nagyobb betűméret
              fontWeight: FontWeight.bold, // Vastag betűk
            ),
          ),
        ),
        const SizedBox(height: 20.0), // Kis hely az első szöveg alatt
        Text(
          'Felhasználó neve: ${user.username}', // UserInfoDto username attribútum
          style: const TextStyle(fontSize: 16.0), // Normál méretű szöveg
        ),
        const SizedBox(height: 8.0),
        Text(
          'Családi név: ${user.familyName}', // UserInfoDto familyName attribútum
          style: const TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Keresztnév: ${user.givenName}', // UserInfoDto givenName attribútum
          style: const TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Telefonszám: ${user.phoneNumber}', // UserInfoDto phoneNumber attribútum
          style: const TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 8.0),
        Text(
          'E-mail cím: ${user.emailAddress}', // UserInfoDto emailAddress attribútum
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}

