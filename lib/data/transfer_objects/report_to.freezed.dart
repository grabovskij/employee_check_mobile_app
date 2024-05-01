// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_to.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReportTO _$ReportTOFromJson(Map<String, dynamic> json) {
  return _ReportTO.fromJson(json);
}

/// @nodoc
mixin _$ReportTO {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  bool get isEnter => throw _privateConstructorUsedError;
  String get photo => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportTOCopyWith<ReportTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportTOCopyWith<$Res> {
  factory $ReportTOCopyWith(ReportTO value, $Res Function(ReportTO) then) =
      _$ReportTOCopyWithImpl<$Res, ReportTO>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at') String createdAt,
      bool isEnter,
      String photo,
      @JsonKey(name: 'user_id') String userId});
}

/// @nodoc
class _$ReportTOCopyWithImpl<$Res, $Val extends ReportTO>
    implements $ReportTOCopyWith<$Res> {
  _$ReportTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? isEnter = null,
    Object? photo = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      isEnter: null == isEnter
          ? _value.isEnter
          : isEnter // ignore: cast_nullable_to_non_nullable
              as bool,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportTOImplCopyWith<$Res>
    implements $ReportTOCopyWith<$Res> {
  factory _$$ReportTOImplCopyWith(
          _$ReportTOImpl value, $Res Function(_$ReportTOImpl) then) =
      __$$ReportTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at') String createdAt,
      bool isEnter,
      String photo,
      @JsonKey(name: 'user_id') String userId});
}

/// @nodoc
class __$$ReportTOImplCopyWithImpl<$Res>
    extends _$ReportTOCopyWithImpl<$Res, _$ReportTOImpl>
    implements _$$ReportTOImplCopyWith<$Res> {
  __$$ReportTOImplCopyWithImpl(
      _$ReportTOImpl _value, $Res Function(_$ReportTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? isEnter = null,
    Object? photo = null,
    Object? userId = null,
  }) {
    return _then(_$ReportTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      isEnter: null == isEnter
          ? _value.isEnter
          : isEnter // ignore: cast_nullable_to_non_nullable
              as bool,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportTOImpl implements _ReportTO {
  const _$ReportTOImpl(
      {this.id = 0,
      @JsonKey(name: 'created_at') this.createdAt = '',
      this.isEnter = true,
      this.photo = '',
      @JsonKey(name: 'user_id') this.userId = ''});

  factory _$ReportTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportTOImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey()
  final bool isEnter;
  @override
  @JsonKey()
  final String photo;
  @override
  @JsonKey(name: 'user_id')
  final String userId;

  @override
  String toString() {
    return 'ReportTO(id: $id, createdAt: $createdAt, isEnter: $isEnter, photo: $photo, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isEnter, isEnter) || other.isEnter == isEnter) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, createdAt, isEnter, photo, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportTOImplCopyWith<_$ReportTOImpl> get copyWith =>
      __$$ReportTOImplCopyWithImpl<_$ReportTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportTOImplToJson(
      this,
    );
  }
}

abstract class _ReportTO implements ReportTO {
  const factory _ReportTO(
      {final int id,
      @JsonKey(name: 'created_at') final String createdAt,
      final bool isEnter,
      final String photo,
      @JsonKey(name: 'user_id') final String userId}) = _$ReportTOImpl;

  factory _ReportTO.fromJson(Map<String, dynamic> json) =
      _$ReportTOImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  bool get isEnter;
  @override
  String get photo;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$ReportTOImplCopyWith<_$ReportTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
