import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:balatonivizeken_admin/features/storm/providers/create_storm_alert.controller.dart';
import 'package:balatonivizeken_admin/shared/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/consts/storm_station_list.dart';
import '../../shared/widgets/snack.dart';
import 'models/storm_degree.enum.dart';

class StormDialog extends ConsumerStatefulWidget {
  const StormDialog({super.key});

  @override
  _StormDialogState createState() => _StormDialogState();
}

class _StormDialogState extends ConsumerState<StormDialog> {
  final _formKey = GlobalKey<FormState>();

  String? area;
  StormDegree? degree;
  int windSpeed = 0;
  TimeOfDay? time;

  Timer? timer;
  bool isIncreasingPressed = false;
  bool isDecreasingPressed = false;

  void _startIncreasing() {
    setState(() {
      isIncreasingPressed = true;
    });
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        windSpeed++;
      });
    });
  }

  void _startDecreasing() {
    setState(() {
      isDecreasingPressed = true;
    });
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        if (windSpeed > 0) windSpeed--;
      });
    });
  }

  void _stopTimer() {
    setState(() {
      isIncreasingPressed = false;
      isDecreasingPressed = false;
    });
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      createStormAlertControllerProvider,
      (_, sendStatus) {
        if (!sendStatus.isLoading) {
          if (sendStatus.hasError) {
            Snack.show(context, text: 'Sikertelen küldés');
          }
          else {
            Snack.show(context, text: 'Viharjelzés sikeresen elküldve');
            context.router.maybePop();
          }
        }
      },
    );

    return AlertDialog(
      title: const Text('Viharjelzés létrehozása'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // 1. DropdownMenu a stormStationList-hez, FormField-ként
            _areaSelector(),
            const SizedBox(height: 25),
            // 2. Időpontválasztó, FormField-ként
            _timeSetter(context),
            const SizedBox(height: 25),
            // 3. DropdownMenu a StormDegree enumhoz, FormField-ként
            _degreeSelector(),
            const SizedBox(height: 25),
            // 4. Szám növelése/csökkentése, FormField-ként
            _windSpeedSetter(),
          ],
        ),
      ),
      actions: <Widget>[
        _sendButton(context),
        _cancelButton(context),
      ],
    );
  }

  TextButton _sendButton(BuildContext context) {
    final sendStatus = ref.watch(createStormAlertControllerProvider);
    return TextButton(
      onPressed: sendStatus.isLoading ?
          null
          : () async {
            if (_formKey.currentState?.validate() ?? false) {
              await ref.read(createStormAlertControllerProvider.notifier).createStorm(
                area: area!,
                time: time!,
                degree: degree!,
                windSpeed: windSpeed
              );
            }
          },
      child: sendStatus.isLoading ?
          const CircularProgressIndicator()
          : const Text('Küldés'),
    );
  }

  Widget _cancelButton(BuildContext context) {
    return TextButton(
      child: const Text('Mégse'),
      onPressed: () {
        context.router.maybePop();
      },
    );
  }

  Widget _windSpeedSetter() {
    return FormField<int>(
      builder: (FormFieldState<int> state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('Adja meg a szélsebességet:'),
            const SizedBox(width: 20),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (windSpeed > 0) windSpeed--;
                    state.didChange(windSpeed);
                  });
                },
                onLongPressStart: (_) => _startDecreasing(),
                onLongPressEnd: (_) {
                  _stopTimer();
                  state.didChange(windSpeed);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isDecreasingPressed
                        ? Colors.grey[400]
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.remove),
                ),
              ),
            ),
            Text('$windSpeed km/h'),
            const SizedBox(width: 10),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    windSpeed++;
                    state.didChange(windSpeed);
                  });
                },
                onLongPressStart: (_) => _startIncreasing(),
                onLongPressEnd: (_) {
                  _stopTimer();
                  state.didChange(windSpeed);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isIncreasingPressed
                        ? Colors.grey[400]
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          ],
        );
      },
      validator: (value) => windSpeed <= 0
          ? 'A szélsebesség nem lehet 0'
          : null,
    );
  }

  Widget _degreeSelector() {
    return FormField<StormDegree>(
      builder: (FormFieldState<StormDegree> state) {
        return DropdownButtonFormField<StormDegree>(
          value: degree,
          hint: const Text('Válasszon fokozatot'),
          onChanged: (StormDegree? newValue) {
            setState(() {
              degree = newValue;
              state.didChange(newValue);
            });
          },
          validator: (value) => value == null ? 'Kérjük, válasszon fokozatot' : null,
          items: StormDegree.values
              .map<DropdownMenuItem<StormDegree>>((StormDegree value) {
            return DropdownMenuItem<StormDegree>(
              value: value,
              child: Text(value.displayName),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _timeSetter(BuildContext context) {
    return FormField<TimeOfDay>(
      builder: (FormFieldState<TimeOfDay> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () async {
                TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  setState(() {
                    time = picked;
                    state.didChange(picked);
                  });
                }
              },
              child: Text(time != null
                  ? 'Kiválasztott idő: ${time!.format(context)}'
                  : 'Időpont választása'),
            ),
            if (state.hasError)
              Text(
                state.errorText!,
                style: const TextStyle(color: BalatoniVizekenColors.red),
              ),
          ],
        );
      },
      validator: (value) => value == null ? 'Kérjük, válasszon időpontot' : null,
    );
  }

  Widget _areaSelector() {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return DropdownButtonFormField<String>(
          value: area,
          hint: const Text('Válassza ki a viharjelző állomást'),
          onChanged: (String? newValue) {
            setState(() {
              area = newValue;
              state.didChange(newValue);
            });
          },
          validator: (value) =>
          value == null ? 'Kérjük, válasszon állomást' : null,
          items: stormStationList
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}