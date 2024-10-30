import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken_admin/features/no_go_zone/models/location/location.dto.dart';
import 'package:balatonivizeken_admin/features/no_go_zone/providers/polygon.provider.dart';
import 'package:balatonivizeken_admin/features/no_go_zone/types.dart';
import 'package:balatonivizeken_admin/features/no_go_zone/providers/no_go_zone.controller.dart';
import 'package:balatonivizeken_admin/shared/widgets/full_page_progress_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:flutter_map_line_editor/flutter_map_line_editor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../shared/widgets/snack.dart';

@RoutePage()
class NoGoZoneScreen extends ConsumerStatefulWidget {
  const NoGoZoneScreen({super.key});

  @override
  _NoGoZoneScreenState createState() => _NoGoZoneScreenState();
}

class _NoGoZoneScreenState extends ConsumerState<NoGoZoneScreen> {
  var screenState = NoGoZoneScreenState.viewing;
  var index = 0;

  final LayerHitNotifier<HitValue> _hitNotifier = ValueNotifier(null);
  List<HitValue>? _prevHitValues;
  List<Polygon<HitValue>>? _hoverGons;

  var polygons = <Polygon<HitValue>>[];

  PolyEditor? polyEditor;
  Polygon<HitValue>? editedPolygon;

  @override
  Widget build(BuildContext context) {
    final polygonsFromProvider = ref.watch(polygonListProvider);
    if ( ! polygonsFromProvider.hasError && polygonsFromProvider.hasValue) {
      polygons = polygonsFromProvider.value!.toList();
      index = polygonsFromProvider.value!.length;
    }

    return Stack(
      children: [
        Scaffold(
          body: _noGoZonesMap(),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: _floatingActionButtons(),
        ),
        if (polygonsFromProvider.isLoading)
          const FullPageProgressIndicator()
      ]
    );
  }

  Widget _floatingActionButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (screenState == NoGoZoneScreenState.viewing)
          _addFAB(),
        if ( ! (screenState == NoGoZoneScreenState.viewing))
          _confirmFAB(),
        if (screenState == NoGoZoneScreenState.creating)
          const SizedBox(
            height: 10,
          ),
        if (screenState == NoGoZoneScreenState.creating)
          _undoFAB(),
      ],
    );
  }

  Widget _undoFAB() {
    return FloatingActionButton(
      tooltip: 'Visszavonás',
      child: const Icon(Icons.undo),
      onPressed: () {
        setState(() {
          screenState = NoGoZoneScreenState.viewing;
          editedPolygon = null;
          polyEditor = null;
        });
      },
    );
  }

  Widget _confirmFAB() {
    return FloatingActionButton(
      tooltip: 'Véglegesítés',
      child: const Icon(Icons.check),
      onPressed: () {
        if (editedPolygon!.points.isNotEmpty) {
          final newPolygon = Polygon<HitValue>(
              borderColor: Colors.red,
              borderStrokeWidth: 3,
              pattern: const StrokePattern.dotted(),
              color: const Color.fromRGBO(244, 67, 54, 0.2),
              points: _copyPointsList(editedPolygon!.points),
              hitValue: screenState == NoGoZoneScreenState.modifying ?
                editedPolygon?.hitValue as HitValue
                : (id: null, index: index)
          );

          setState(() {
              if (screenState == NoGoZoneScreenState.creating) {
                index++;
              }
              polygons.add(newPolygon);
              screenState = NoGoZoneScreenState.viewing;
              editedPolygon = null;
              polyEditor = null;
          });

          ref.read(noGoZoneControllerProvider.notifier).createOrUpdateNoGoZone(
            id: newPolygon.hitValue!.id,
            zonePoints: newPolygon.points.map((point) => LocationDto(latitude: point.latitude, longitude: point.longitude)).toList()
          );
        }
        else {
          Snack.show(context, text: 'Adjon hozzá pontokat a zónához');
        }
      },
    );
  }

  Widget _addFAB() {
    return FloatingActionButton(
      tooltip: 'No-go zóna hozzáadása',
      child: const Icon(Icons.add),
      onPressed: () {
        setState(() {
          screenState = NoGoZoneScreenState.creating;
          editedPolygon = Polygon(
            borderColor: Colors.red,
            borderStrokeWidth: 3,
            pattern: const StrokePattern.dotted(),
            color: const Color.fromRGBO(244, 67, 54, 0.2),
            points: [],
          );
          polyEditor = PolyEditor(
            addClosePathMarker: true,
            points: editedPolygon!.points,
            pointIcon: const Icon(Icons.crop_square, size: 23),
            intermediateIcon: const Icon(Icons.lens, size: 15, color: Colors.grey),
            callbackRefresh: (LatLng? _) => {setState(() {} )},
          );
        });
      },
    );
  }

  Widget _noGoZonesMap() {
    return FlutterMap(
      options: MapOptions(
        onTap: !(screenState == NoGoZoneScreenState.viewing) ?
            (_, ll) {
              polyEditor?.add(polyEditor!.points, ll);
            }
            : null,
        initialCenter: const LatLng(46.78, 17.77),
        initialZoom: 10,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        ),
        MouseRegion(
          hitTestBehavior: HitTestBehavior.deferToChild,
          cursor: SystemMouseCursors.click,
          onHover: (_) {
            final hitValues = _hitNotifier.value?.hitValues.toList();
            if (hitValues == null) return;

            if (listEquals(hitValues, _prevHitValues)) return;
            _prevHitValues = hitValues;
            final hoverLines = hitValues.map((v) {
              final original = polygons.firstWhere((p) => p.hitValue == v);

              return Polygon<HitValue>(
                points: original.points,
                holePointsList: original.holePointsList,
                color: original.color,
                borderStrokeWidth: 15,
                borderColor: Colors.green,
                disableHolesBorder: original.disableHolesBorder,
              );
            }).toList();
            setState(() => _hoverGons = hoverLines);
          },
          onExit: (_) {
            _prevHitValues = null;
            setState(() => _hoverGons = null);
          },
          child: GestureDetector(
            onTap: () {
              if (screenState == NoGoZoneScreenState.viewing) {
                _openZoneDialog(
                  'Tapped',
                  _hitNotifier.value!.hitValues,
                  _hitNotifier.value!.coordinate,
                );
              }
            },
            onLongPress: () {
              if (screenState == NoGoZoneScreenState.viewing) {
                _openZoneDialog(
                  'Long pressed',
                  _hitNotifier.value!.hitValues,
                  _hitNotifier.value!.coordinate,
                );
              }
            },
            onSecondaryTap: () {
              if (screenState == NoGoZoneScreenState.viewing) {
                _openZoneDialog(
                  'Secondary tapped',
                  _hitNotifier.value!.hitValues,
                  _hitNotifier.value!.coordinate,
                );
              }
            },
            child: PolygonLayer(
              hitNotifier: _hitNotifier,
              simplificationTolerance: 0,
              polygons: [...polygons, ...?_hoverGons],
            ),
          ),
        ),
        if ( ! (screenState == NoGoZoneScreenState.viewing))
          PolygonLayer(
            simplificationTolerance: 0,
            polygons: [if (editedPolygon!.points.isNotEmpty) editedPolygon!],
          ),
        if ( ! (screenState == NoGoZoneScreenState.viewing))
          DragMarkers(markers: polyEditor!.edit()),
      ],
    );
  }

  List<LatLng> _copyPointsList(List<LatLng> pointsList) {
    final copyList = <LatLng>[];
    for (var element in pointsList) {
      copyList.add(LatLng(element.latitude, element.longitude));
    }
    return copyList;
  }

  void _openZoneDialog(
      String eventType,
      List<HitValue> tappedZoneHitValues,
      LatLng coords,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          tappedZoneHitValues.length == 1 ? 'Egy zóna kiválasztva' : 'Több zóna kiválasztva',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          _deleteButton(tappedZoneHitValues, context),
          _modifyButton(tappedZoneHitValues, context),
          _cancelButton(context)
        ],
      )
    );
  }

  Widget _cancelButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.router.maybePop();
      },
      child: const Text('Mégse'),
    );
  }

  Widget _modifyButton(List<HitValue> tappedZoneHitValues, BuildContext context) {
    return TextButton(
      onPressed: () {
        final selectedPolygon = polygons.firstWhere((element) => tappedZoneHitValues.contains(element.hitValue));

        setState(() {
          screenState = NoGoZoneScreenState.modifying;
          editedPolygon = Polygon<HitValue>(
              borderColor: Colors.green,
              borderStrokeWidth: 3,
              pattern: const StrokePattern.dotted(),
              color: const Color.fromRGBO(144, 238, 144, 0.2),
              points: _copyPointsList(selectedPolygon.points),
              hitValue: selectedPolygon.hitValue
          );
          polyEditor = PolyEditor(
            addClosePathMarker: true,
            points: editedPolygon!.points,
            pointIcon: const Icon(Icons.crop_square, size: 23),
            intermediateIcon: const Icon(Icons.lens, size: 15, color: Colors.grey),
            callbackRefresh: (LatLng? _) => {setState(() {} )},
          );
          polygons.remove(selectedPolygon);
        });

        context.router.maybePop();
      },
      child: const Text('Módosítás'),
    );
  }

  Widget _deleteButton(List<HitValue> tappedZoneHitValues, BuildContext context) {
    return TextButton(
      onPressed: () {

        setState(() {
          polygons.removeWhere((element) => tappedZoneHitValues.contains(element.hitValue));
        });

        for (var hitValue in tappedZoneHitValues) {
          if (hitValue.id != null) {
            ref.read(noGoZoneControllerProvider.notifier).deleteNoGoZone(id: hitValue.id!);
          }
        }

        context.router.maybePop();
      },
      child: const Text('Törlés'),
    );
  }
}