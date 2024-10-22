// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storm_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StormInputDto _$StormInputDtoFromJson(Map<String, dynamic> json) {
  return _StormInputDto.fromJson(json);
}

/// @nodoc
mixin _$StormInputDto {
  String get area => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  StormDegree get degree => throw _privateConstructorUsedError;
  int get windSpeed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StormInputDtoCopyWith<StormInputDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StormInputDtoCopyWith<$Res> {
  factory $StormInputDtoCopyWith(
          StormInputDto value, $Res Function(StormInputDto) then) =
      _$StormInputDtoCopyWithImpl<$Res, StormInputDto>;
  @useResult
  $Res call(
      {String area,
      double longitude,
      double latitude,
      String date,
      StormDegree degree,
      int windSpeed});
}

/// @nodoc
class _$StormInputDtoCopyWithImpl<$Res, $Val extends StormInputDto>
    implements $StormInputDtoCopyWith<$Res> {
  _$StormInputDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? area = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? date = null,
    Object? degree = null,
    Object? windSpeed = null,
  }) {
    return _then(_value.copyWith(
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      degree: null == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as StormDegree,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StormInputDtoImplCopyWith<$Res>
    implements $StormInputDtoCopyWith<$Res> {
  factory _$$StormInputDtoImplCopyWith(
          _$StormInputDtoImpl value, $Res Function(_$StormInputDtoImpl) then) =
      __$$StormInputDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String area,
      double longitude,
      double latitude,
      String date,
      StormDegree degree,
      int windSpeed});
}

/// @nodoc
class __$$StormInputDtoImplCopyWithImpl<$Res>
    extends _$StormInputDtoCopyWithImpl<$Res, _$StormInputDtoImpl>
    implements _$$StormInputDtoImplCopyWith<$Res> {
  __$$StormInputDtoImplCopyWithImpl(
      _$StormInputDtoImpl _value, $Res Function(_$StormInputDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? area = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? date = null,
    Object? degree = null,
    Object? windSpeed = null,
  }) {
    return _then(_$StormInputDtoImpl(
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      degree: null == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as StormDegree,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StormInputDtoImpl implements _StormInputDto {
  const _$StormInputDtoImpl(
      {required this.area,
      required this.longitude,
      required this.latitude,
      required this.date,
      required this.degree,
      required this.windSpeed});

  factory _$StormInputDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StormInputDtoImplFromJson(json);

  @override
  final String area;
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final String date;
  @override
  final StormDegree degree;
  @override
  final int windSpeed;

  @override
  String toString() {
    return 'StormInputDto(area: $area, longitude: $longitude, latitude: $latitude, date: $date, degree: $degree, windSpeed: $windSpeed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StormInputDtoImpl &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.degree, degree) || other.degree == degree) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, area, longitude, latitude, date, degree, windSpeed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StormInputDtoImplCopyWith<_$StormInputDtoImpl> get copyWith =>
      __$$StormInputDtoImplCopyWithImpl<_$StormInputDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StormInputDtoImplToJson(
      this,
    );
  }
}

abstract class _StormInputDto implements StormInputDto {
  const factory _StormInputDto(
      {required final String area,
      required final double longitude,
      required final double latitude,
      required final String date,
      required final StormDegree degree,
      required final int windSpeed}) = _$StormInputDtoImpl;

  factory _StormInputDto.fromJson(Map<String, dynamic> json) =
      _$StormInputDtoImpl.fromJson;

  @override
  String get area;
  @override
  double get longitude;
  @override
  double get latitude;
  @override
  String get date;
  @override
  StormDegree get degree;
  @override
  int get windSpeed;
  @override
  @JsonKey(ignore: true)
  _$$StormInputDtoImplCopyWith<_$StormInputDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
