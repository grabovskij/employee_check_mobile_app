// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_transfer_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileTransferObject _$ProfileTransferObjectFromJson(
    Map<String, dynamic> json) {
  return _ProfileTransferObject.fromJson(json);
}

/// @nodoc
mixin _$ProfileTransferObject {
  @JsonKey(name: 'user_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo')
  String get photo => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'second_name')
  String get secondName => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_admin')
  bool get isAdmin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileTransferObjectCopyWith<ProfileTransferObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileTransferObjectCopyWith<$Res> {
  factory $ProfileTransferObjectCopyWith(ProfileTransferObject value,
          $Res Function(ProfileTransferObject) then) =
      _$ProfileTransferObjectCopyWithImpl<$Res, ProfileTransferObject>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String id,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'photo') String photo,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      @JsonKey(name: 'second_name') String secondName,
      @JsonKey(name: 'is_admin') bool isAdmin});
}

/// @nodoc
class _$ProfileTransferObjectCopyWithImpl<$Res,
        $Val extends ProfileTransferObject>
    implements $ProfileTransferObjectCopyWith<$Res> {
  _$ProfileTransferObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? photo = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? secondName = null,
    Object? isAdmin = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      secondName: null == secondName
          ? _value.secondName
          : secondName // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileTransferObjectImplCopyWith<$Res>
    implements $ProfileTransferObjectCopyWith<$Res> {
  factory _$$ProfileTransferObjectImplCopyWith(
          _$ProfileTransferObjectImpl value,
          $Res Function(_$ProfileTransferObjectImpl) then) =
      __$$ProfileTransferObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String id,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'photo') String photo,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      @JsonKey(name: 'second_name') String secondName,
      @JsonKey(name: 'is_admin') bool isAdmin});
}

/// @nodoc
class __$$ProfileTransferObjectImplCopyWithImpl<$Res>
    extends _$ProfileTransferObjectCopyWithImpl<$Res,
        _$ProfileTransferObjectImpl>
    implements _$$ProfileTransferObjectImplCopyWith<$Res> {
  __$$ProfileTransferObjectImplCopyWithImpl(_$ProfileTransferObjectImpl _value,
      $Res Function(_$ProfileTransferObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? photo = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? secondName = null,
    Object? isAdmin = null,
  }) {
    return _then(_$ProfileTransferObjectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      secondName: null == secondName
          ? _value.secondName
          : secondName // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileTransferObjectImpl implements _ProfileTransferObject {
  const _$ProfileTransferObjectImpl(
      {@JsonKey(name: 'user_id') this.id = '',
      @JsonKey(name: 'email') this.email = '',
      @JsonKey(name: 'photo') this.photo = '',
      @JsonKey(name: 'first_name') this.firstName = '',
      @JsonKey(name: 'last_name') this.lastName = '',
      @JsonKey(name: 'second_name') this.secondName = '',
      @JsonKey(name: 'is_admin') this.isAdmin = false});

  factory _$ProfileTransferObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileTransferObjectImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String id;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'photo')
  final String photo;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  @JsonKey(name: 'second_name')
  final String secondName;
  @override
  @JsonKey(name: 'is_admin')
  final bool isAdmin;

  @override
  String toString() {
    return 'ProfileTransferObject(id: $id, email: $email, photo: $photo, firstName: $firstName, lastName: $lastName, secondName: $secondName, isAdmin: $isAdmin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileTransferObjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.secondName, secondName) ||
                other.secondName == secondName) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, email, photo, firstName, lastName, secondName, isAdmin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileTransferObjectImplCopyWith<_$ProfileTransferObjectImpl>
      get copyWith => __$$ProfileTransferObjectImplCopyWithImpl<
          _$ProfileTransferObjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileTransferObjectImplToJson(
      this,
    );
  }
}

abstract class _ProfileTransferObject implements ProfileTransferObject {
  const factory _ProfileTransferObject(
          {@JsonKey(name: 'user_id') final String id,
          @JsonKey(name: 'email') final String email,
          @JsonKey(name: 'photo') final String photo,
          @JsonKey(name: 'first_name') final String firstName,
          @JsonKey(name: 'last_name') final String lastName,
          @JsonKey(name: 'second_name') final String secondName,
          @JsonKey(name: 'is_admin') final bool isAdmin}) =
      _$ProfileTransferObjectImpl;

  factory _ProfileTransferObject.fromJson(Map<String, dynamic> json) =
      _$ProfileTransferObjectImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get id;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'photo')
  String get photo;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  @JsonKey(name: 'second_name')
  String get secondName;
  @override
  @JsonKey(name: 'is_admin')
  bool get isAdmin;
  @override
  @JsonKey(ignore: true)
  _$$ProfileTransferObjectImplCopyWith<_$ProfileTransferObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}
