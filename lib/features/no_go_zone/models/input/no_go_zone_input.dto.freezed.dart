// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'no_go_zone_input.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NoGoZoneInputDto _$NoGoZoneInputDtoFromJson(Map<String, dynamic> json) {
  return _NoGoZoneInputDto.fromJson(json);
}

/// @nodoc
mixin _$NoGoZoneInputDto {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  List<LocationDto> get zonePoints => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoGoZoneInputDtoCopyWith<NoGoZoneInputDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoGoZoneInputDtoCopyWith<$Res> {
  factory $NoGoZoneInputDtoCopyWith(
          NoGoZoneInputDto value, $Res Function(NoGoZoneInputDto) then) =
      _$NoGoZoneInputDtoCopyWithImpl<$Res, NoGoZoneInputDto>;
  @useResult
  $Res call({@JsonKey(name: "_id") String? id, List<LocationDto> zonePoints});
}

/// @nodoc
class _$NoGoZoneInputDtoCopyWithImpl<$Res, $Val extends NoGoZoneInputDto>
    implements $NoGoZoneInputDtoCopyWith<$Res> {
  _$NoGoZoneInputDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? zonePoints = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      zonePoints: null == zonePoints
          ? _value.zonePoints
          : zonePoints // ignore: cast_nullable_to_non_nullable
              as List<LocationDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoGoZoneInputDtoImplCopyWith<$Res>
    implements $NoGoZoneInputDtoCopyWith<$Res> {
  factory _$$NoGoZoneInputDtoImplCopyWith(_$NoGoZoneInputDtoImpl value,
          $Res Function(_$NoGoZoneInputDtoImpl) then) =
      __$$NoGoZoneInputDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "_id") String? id, List<LocationDto> zonePoints});
}

/// @nodoc
class __$$NoGoZoneInputDtoImplCopyWithImpl<$Res>
    extends _$NoGoZoneInputDtoCopyWithImpl<$Res, _$NoGoZoneInputDtoImpl>
    implements _$$NoGoZoneInputDtoImplCopyWith<$Res> {
  __$$NoGoZoneInputDtoImplCopyWithImpl(_$NoGoZoneInputDtoImpl _value,
      $Res Function(_$NoGoZoneInputDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? zonePoints = null,
  }) {
    return _then(_$NoGoZoneInputDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      zonePoints: null == zonePoints
          ? _value._zonePoints
          : zonePoints // ignore: cast_nullable_to_non_nullable
              as List<LocationDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoGoZoneInputDtoImpl implements _NoGoZoneInputDto {
  const _$NoGoZoneInputDtoImpl(
      {@JsonKey(name: "_id") required this.id,
      required final List<LocationDto> zonePoints})
      : _zonePoints = zonePoints;

  factory _$NoGoZoneInputDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoGoZoneInputDtoImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  final List<LocationDto> _zonePoints;
  @override
  List<LocationDto> get zonePoints {
    if (_zonePoints is EqualUnmodifiableListView) return _zonePoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_zonePoints);
  }

  @override
  String toString() {
    return 'NoGoZoneInputDto(id: $id, zonePoints: $zonePoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoGoZoneInputDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._zonePoints, _zonePoints));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_zonePoints));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoGoZoneInputDtoImplCopyWith<_$NoGoZoneInputDtoImpl> get copyWith =>
      __$$NoGoZoneInputDtoImplCopyWithImpl<_$NoGoZoneInputDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoGoZoneInputDtoImplToJson(
      this,
    );
  }
}

abstract class _NoGoZoneInputDto implements NoGoZoneInputDto {
  const factory _NoGoZoneInputDto(
      {@JsonKey(name: "_id") required final String? id,
      required final List<LocationDto> zonePoints}) = _$NoGoZoneInputDtoImpl;

  factory _NoGoZoneInputDto.fromJson(Map<String, dynamic> json) =
      _$NoGoZoneInputDtoImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  List<LocationDto> get zonePoints;
  @override
  @JsonKey(ignore: true)
  _$$NoGoZoneInputDtoImplCopyWith<_$NoGoZoneInputDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
