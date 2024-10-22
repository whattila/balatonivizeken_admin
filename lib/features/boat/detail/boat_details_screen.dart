import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken_admin/features/boat/detail/providers/boat.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/consts/colors.dart';
import '../../../shared/router/router.dart';
import '../../../shared/widgets/error_widget.dart';
import '../../../shared/widgets/full_page_progress_indicator.dart';
import '../../../shared/widgets/unattached_screens_wrapper.dart';
import '../list/models/boat.header.dart';
import 'models/boat.model.dart';

@RoutePage()
class BoatDetailsScreen extends ConsumerWidget {
  const BoatDetailsScreen({required this.boatHeader, super.key});

  final BoatHeaderDto boatHeader;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boatInfo = ref.watch(boatByIdProvider(id: boatHeader.id!));

    return UnattachedScreensWrapper(
      isLoading: false,
      canPop: true,
      content: boatInfo.when(
          data: (data) => BoatDetailsBody(boat: data),
          error: (error, stackTrace) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: NetworkErrorWidget(errorMessage: 'Probléma a betöltésnél',),
          ),
          loading: () => const FullPageProgressIndicator()
      ),
    );
  }
}

class BoatDetailsBody extends StatelessWidget {
  const BoatDetailsBody({required this.boat, super.key});

  final BoatDto boat;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Balra igazított szövegek
      children: [
        const Center(
          child: Text(
            'Hajó Részletek', // Középen megjelenő cím
            style: TextStyle(
              fontSize: 24.0, // Nagyobb betűméret
              fontWeight: FontWeight.bold, // Vastag betűk
            ),
          ),
        ),
        const SizedBox(height: 20.0), // Kis hely az első szöveg alatt
        Text(
          'Hajó neve: ${boat.displayName}', // BoatDto displayName attribútum
          style: const TextStyle(fontSize: 16.0), // Normál méretű szöveg
        ),
        const SizedBox(height: 8.0), // Kis hely a sorok között
        Text(
          'Hajó típusa: ${boat.boatType.toString()}', // BoatDto boatType attribútum
          style: const TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 8.0), // Kis hely a sorok között
        Text(
          'Hajó színe: ${boat.boatColor ?? "Nincs megadva"}', // BoatDto boatColor attribútum
          style: const TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 8.0), // Kis hely a sorok között
        GestureDetector(
            child: const Text(
              'Tulajdonos adatainak megtekintése',
              style: TextStyle(
                  color: BalatoniVizekenColors.purple,
                  fontWeight: FontWeight.bold
              ),
            ),
            onTap: () => context.router.push(UserDetailsRoute(userId: boat.userId))
        ),
      ],
    );
  }
}
