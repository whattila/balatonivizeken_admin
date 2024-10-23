import 'package:balatonivizeken_admin/features/boat/list/models/boat.header.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_boat.provider.g.dart';

@riverpod
class SelectedBoat extends _$SelectedBoat {
  @override
  BoatHeaderDto? build() => null;

  void setSelectedBoat(BoatHeaderDto boat) {
    state = boat;
  }
}