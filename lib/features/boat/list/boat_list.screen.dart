import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken_admin/features/boat/boat_type.enum.dart';
import 'package:balatonivizeken_admin/features/boat/list/models/boat.header.dart';
import 'package:balatonivizeken_admin/features/boat/list/providers/boat_list.provider.dart';
import 'package:balatonivizeken_admin/features/boat/list/providers/selected_boat.provider.dart';
import 'package:balatonivizeken_admin/shared/consts/screen_widths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/consts/colors.dart';
import '../../../shared/router/router.dart';
import '../../../shared/widgets/error_widget.dart';
import '../../../shared/widgets/full_page_progress_indicator.dart';
import '../detail/boat_details_screen.dart';

@RoutePage()
class BoatListScreen extends ConsumerStatefulWidget {
  const BoatListScreen({super.key});

  @override
  _BoatListScreenState createState() => _BoatListScreenState();
}

class _BoatListScreenState extends ConsumerState<BoatListScreen> {
  @override
  void deactivate() {
    ref.read(boatListProvider.notifier).cancelTimer();
    super.deactivate();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(boatListProvider.notifier).refreshBoats();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final boatList = ref.watch(boatListProvider);

    return boatList.when(
      data: (data) => BoatsView(boatList: boatList.value!),
      error: (error, stackTrace) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: NetworkErrorWidget(errorMessage: 'Probléma a betöltésnél'),
      ),
      loading: () {
        return Stack(
          children: [
            if (boatList.hasValue)
              BoatsView(boatList: boatList.value!),
            if (!boatList.hasValue)
              const SizedBox.shrink(),
            const FullPageProgressIndicator(),
          ],
        );
      },
    );
  }
}

class BoatsView extends ConsumerWidget {
  const BoatsView({super.key, required this.boatList});

  final List<BoatHeaderDto> boatList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Lekérjük a kiválasztott hajót
    final selectedBoat = ref.watch(selectedBoatProvider);

    // A képernyő szélességének lekérése
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= BalatoniVizekenScreenWidths.expanded) {
      // Ha a képernyő szélesebb, egymás mellett mutatjuk a listát és a részleteket
      return Row(
        children: [
          Expanded(
            child: BoatListView(
              boatList: boatList,
              onBoatSelected: (boat) {
                ref.read(selectedBoatProvider.notifier).setSelectedBoat(boat);
              },
            ),
          ),
          Expanded(
            child: selectedBoat == null ?
              const Center(
                child: Text('Válassz egy hajót a listából'),
              )
              : BoatDetailsScreen(boatHeader: selectedBoat),
          ),
        ],
      );
    } else {
      // Ha a képernyő keskenyebb, csak a lista jelenik meg
      return BoatListView(
        boatList: boatList,
        onBoatSelected: (boat) {
          context.router.push(BoatDetailsRoute(boatHeader: boat));
        },
      );
    }
  }
}

class BoatListView extends StatelessWidget {
  const BoatListView({
    super.key,
    required this.boatList,
    required this.onBoatSelected,
  });

  final List<BoatHeaderDto> boatList;
  final ValueChanged<BoatHeaderDto> onBoatSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Scrollbar(
            child: ListView.builder(
              itemCount: boatList.length,
              itemBuilder: (context, index) {
                final item = boatList[index];
                return Card(
                  child: ListTile(
                    tileColor: BalatoniVizekenColors.grey,
                    title: Text(
                      item.displayName,
                      style: const TextStyle(
                        fontSize: 20.0, // Nagyobb betűméret
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      item.boatType.displayName,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    onTap: () => onBoatSelected(item),
                  ),
                );
              },
            ),
          ),
          const BoatRefreshButton(),
        ],
      ),
    );
  }
}

class BoatRefreshButton extends ConsumerWidget {
  const BoatRefreshButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      bottom: 10,
      right: 10,
      child: ElevatedButton(
        onPressed: () {
          ref.read(boatListProvider.notifier).refreshBoats();
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