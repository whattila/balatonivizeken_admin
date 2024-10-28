import 'package:balatonivizeken_admin/features/no_go_zone/providers/no_go_zone.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../types.dart';

part 'polygon.provider.g.dart';

@riverpod
AsyncValue<List<Polygon<HitValue>>> polygonList(PolygonListRef ref) {
  final noGoZones = ref.watch(noGoZoneControllerProvider);
  return noGoZones.when(
      data: (noGoZonesList) => AsyncValue.data(
          noGoZonesList.map(
              (zone) => Polygon<HitValue>(
                points: zone.zonePoints.map((point) => LatLng(point.latitude, point.longitude)).toList(),
                borderColor: Colors.red,
                borderStrokeWidth: 3,
                pattern: const StrokePattern.dotted(),
                color: const Color.fromRGBO(244, 67, 54, 0.2),
                hitValue: (
                  id: zone.id,
                  index: noGoZonesList.indexOf(zone)
                )
              )
          ).toList()
      ),
      error: AsyncValue.error,
      loading: AsyncValue.loading
  );
}