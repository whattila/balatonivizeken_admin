// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boat.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$boatByIdHash() => r'95e1b726872324f3b44839977cedbc32c04a9d90';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [boatById].
@ProviderFor(boatById)
const boatByIdProvider = BoatByIdFamily();

/// See also [boatById].
class BoatByIdFamily extends Family<AsyncValue<BoatDto>> {
  /// See also [boatById].
  const BoatByIdFamily();

  /// See also [boatById].
  BoatByIdProvider call({
    required String id,
  }) {
    return BoatByIdProvider(
      id: id,
    );
  }

  @override
  BoatByIdProvider getProviderOverride(
    covariant BoatByIdProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'boatByIdProvider';
}

/// See also [boatById].
class BoatByIdProvider extends AutoDisposeFutureProvider<BoatDto> {
  /// See also [boatById].
  BoatByIdProvider({
    required String id,
  }) : this._internal(
          (ref) => boatById(
            ref as BoatByIdRef,
            id: id,
          ),
          from: boatByIdProvider,
          name: r'boatByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$boatByIdHash,
          dependencies: BoatByIdFamily._dependencies,
          allTransitiveDependencies: BoatByIdFamily._allTransitiveDependencies,
          id: id,
        );

  BoatByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<BoatDto> Function(BoatByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BoatByIdProvider._internal(
        (ref) => create(ref as BoatByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BoatDto> createElement() {
    return _BoatByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BoatByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BoatByIdRef on AutoDisposeFutureProviderRef<BoatDto> {
  /// The parameter `id` of this provider.
  String get id;
}

class _BoatByIdProviderElement extends AutoDisposeFutureProviderElement<BoatDto>
    with BoatByIdRef {
  _BoatByIdProviderElement(super.provider);

  @override
  String get id => (origin as BoatByIdProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
