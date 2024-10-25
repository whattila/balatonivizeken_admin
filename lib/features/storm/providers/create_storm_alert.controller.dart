import 'package:balatonivizeken_admin/features/storm/models/storm_degree.enum.dart';
import 'package:balatonivizeken_admin/shared/repositories/balatonivizeken_client/balatonivizeken_client.dart';
import 'package:flutter/material.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../shared/consts/env.dart';
import '../../../shared/dio/dio_error_handler.dart';
import '../../../shared/repositories/balatonivizeken_client/balatonivizeken_client.provider.dart';
import '../../../shared/widgets/snack.dart';
import '../models/storm_input.dart';

part 'create_storm_alert.controller.g.dart';

@riverpod
class CreateStormAlertController extends _$CreateStormAlertController {
  @override
  FutureOr<void> build() {
    // no-op
  }

  BalatoniVizekenClient get api => ref.read(
    balatoniVizekenClientProvider(
      onError: (e, handler) {
        DioErrorHandler.handleErrorMessage(e);
        Snack.showWithoutContext(text: DioErrorHandler.getErrorMessage(e));
      },
    ),
  );

  Future<void> createStorm({
    required String area,
    required TimeOfDay time,
    required StormDegree degree,
    required int windSpeed
  }) async {

    late GeoData data;
    try {
      data = await Geocoder2.getDataFromAddress(
        address: area,
        googleMapApiKey: Env.geocodingApiKey
      );
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      return;
    }
    
    final date = _createDateString(time);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() => api.createStorm(
        stormInputDto: StormInputDto(
            area: area,
            longitude: data.longitude,
            latitude: data.latitude,
            date: date,
            degree: degree,
            windSpeed: windSpeed
        )
      )
    );
  }

  String _createDateString(TimeOfDay time) {
    final now = DateTime.now();
    var resultDate = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    if (now.hour >= 12 && time.period == DayPeriod.am) {
      resultDate = resultDate.add(const Duration(days: 1));
    }
    return resultDate.toIso8601String();
  }
}