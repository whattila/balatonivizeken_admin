// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boat.header.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BoatHeaderDto _$BoatHeaderDtoFromJson(Map<String, dynamic> json) {
  return _BoatHeaderDto.fromJson(json);
}

/// @nodoc
mixin _$BoatHeaderDto {
  @JsonKey(name: "_id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: BoatTypeExtension.fromString)
  BoatType get boatType => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoatHeaderDtoCopyWith<BoatHeaderDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoatHeaderDtoCopyWith<$Res> {
  factory $BoatHeaderDtoCopyWith(
          BoatHeaderDto value, $Res Function(BoatHeaderDto) then) =
      _$BoatHeaderDtoCopyWithImpl<$Res, BoatHeaderDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(fromJson: BoatTypeExtension.fromString) BoatType boatType,
      String displayName});
}

/// @nodoc
class _$BoatHeaderDtoCopyWithImpl<$Res, $Val extends BoatHeaderDto>
    implements $BoatHeaderDtoCopyWith<$Res> {
  _$BoatHeaderDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? boatType = null,
    Object? displayName = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      boatType: null == boatType
          ? _value.boatType
          : boatType // ignore: cast_nullable_to_non_nullable
              as BoatType,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoatHeaderDtoImplCopyWith<$Res>
    implements $BoatHeaderDtoCopyWith<$Res> {
  factory _$$BoatHeaderDtoImplCopyWith(
          _$BoatHeaderDtoImpl value, $Res Function(_$BoatHeaderDtoImpl) then) =
      __$$BoatHeaderDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String? id,
      @JsonKey(fromJson: BoatTypeExtension.fromString) BoatType boatType,
      String displayName});
}

/// @nodoc
class __$$BoatHeaderDtoImplCopyWithImpl<$Res>
    extends _$BoatHeaderDtoCopyWithImpl<$Res, _$BoatHeaderDtoImpl>
    implements _$$BoatHeaderDtoImplCopyWith<$Res> {
  __$$BoatHeaderDtoImplCopyWithImpl(
      _$BoatHeaderDtoImpl _value, $Res Function(_$BoatHeaderDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? boatType = null,
    Object? displayName = null,
  }) {
    return _then(_$BoatHeaderDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      boatType: null == boatType
          ? _value.boatType
          : boatType // ignore: cast_nullable_to_non_nullable
              as BoatType,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BoatHeaderDtoImpl implements _BoatHeaderDto {
  const _$BoatHeaderDtoImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(fromJson: BoatTypeExtension.fromString) required this.boatType,
      required this.displayName});

  factory _$BoatHeaderDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoatHeaderDtoImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? id;
  @override
  @JsonKey(fromJson: BoatTypeExtension.fromString)
  final BoatType boatType;
  @override
  final String displayName;

  @override
  String toString() {
    return 'BoatHeaderDto(id: $id, boatType: $boatType, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoatHeaderDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.boatType, boatType) ||
                other.boatType == boatType) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, boatType, displayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoatHeaderDtoImplCopyWith<_$BoatHeaderDtoImpl> get copyWith =>
      __$$BoatHeaderDtoImplCopyWithImpl<_$BoatHeaderDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoatHeaderDtoImplToJson(
      this,
    );
  }
}

abstract class _BoatHeaderDto implements BoatHeaderDto {
  const factory _BoatHeaderDto(
      {@JsonKey(name: "_id") required final String? id,
      @JsonKey(fromJson: BoatTypeExtension.fromString)
      required final BoatType boatType,
      required final String displayName}) = _$BoatHeaderDtoImpl;

  factory _BoatHeaderDto.fromJson(Map<String, dynamic> json) =
      _$BoatHeaderDtoImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get id;
  @override
  @JsonKey(fromJson: BoatTypeExtension.fromString)
  BoatType get boatType;
  @override
  String get displayName;
  @override
  @JsonKey(ignore: true)
  _$$BoatHeaderDtoImplCopyWith<_$BoatHeaderDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
