import 'package:balatonivizeken_admin/features/boat/boat_type.enum.dart';
import 'package:balatonivizeken_admin/features/boat/list/models/boat.header.dart';
import 'package:balatonivizeken_admin/features/boat/list/providers/boat_list.provider.dart';
import 'package:balatonivizeken_admin/shared/repositories/balatonivizeken_client/balatonivizeken_client.dart';
import 'package:balatonivizeken_admin/shared/repositories/balatonivizeken_client/balatonivizeken_client.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/widgets.dart'; // TestWidgetsFlutterBinding-hez

// Mock the BalatoniVizekenClient for isolation
class MockBalatoniVizekenClient extends Mock implements BalatoniVizekenClient {}

// MockFlutterSecureStorage class létrehozása
class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

// a generic Listener class, used to keep track of when a provider notifies its listeners
class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  // Inicializálja a platform bindinget tesztkörnyezetben
  TestWidgetsFlutterBinding.ensureInitialized();

  // Létrehozunk egy mockolt FlutterSecureStorage példányt
  final mockSecureStorage = MockFlutterSecureStorage();

  ProviderContainer makeProviderContainer(MockBalatoniVizekenClient mockBalatoniVizekenClient) {
    final container = ProviderContainer(
      overrides: [
        balatoniVizekenClientProvider(
          onError: (error, handler) {/* no-op */},
        ).overrideWith((ref) => mockBalatoniVizekenClient),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUpAll(() {
    registerFallbackValue(<BoatHeaderDto>[]);
    when(() => mockSecureStorage.read(key: any(named: 'key')))
        .thenAnswer((_) async => 'mocked_token_value'); // Példa mock adatra
    when(() => mockSecureStorage.write(key: any(named: 'key'), value: any(named: 'value')))
        .thenAnswer((_) async => {});
  });

  test('BoatList state should equal api.getBoatHeaders() return value after creation', () async {
    final mockApi = MockBalatoniVizekenClient();
    const mockBoatHeaders = [
      BoatHeaderDto(id: '1', boatType: BoatType.licensedBoat, displayName: 'Boat 1'),
      BoatHeaderDto(id: '2', boatType: BoatType.smallBoat, displayName: 'Boat 2'),
    ];

    when(() => mockApi.getBoatHeaders()).thenAnswer((_) async => mockBoatHeaders);

    final container = makeProviderContainer(mockApi);
    final listener = Listener<AsyncValue<List<BoatHeaderDto>>>();

    container.listen<AsyncValue<List<BoatHeaderDto>>>(
      boatListProvider,
      listener.call,
      fireImmediately: true,
    );

    verify(() => listener(null, const AsyncLoading<List<BoatHeaderDto>>())).called(1);

    await container.read(boatListProvider.future);

    verify(() => listener(const AsyncLoading<List<BoatHeaderDto>>(), AsyncData(mockBoatHeaders))).called(1);

    verifyNoMoreInteractions(listener);
  });
}
