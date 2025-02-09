// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) {
  return _LoginRequest.fromJson(json);
}

/// @nodoc
mixin _$LoginRequest {
  @JsonKey(name: 'id_token')
  String get idToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'push_token')
  String get pushToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'auth_provider')
  String get authProvider => throw _privateConstructorUsedError;

  /// Serializes this LoginRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginRequestCopyWith<LoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginRequestCopyWith<$Res> {
  factory $LoginRequestCopyWith(
          LoginRequest value, $Res Function(LoginRequest) then) =
      _$LoginRequestCopyWithImpl<$Res, LoginRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_token') String idToken,
      @JsonKey(name: 'push_token') String pushToken,
      @JsonKey(name: 'auth_provider') String authProvider});
}

/// @nodoc
class _$LoginRequestCopyWithImpl<$Res, $Val extends LoginRequest>
    implements $LoginRequestCopyWith<$Res> {
  _$LoginRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = null,
    Object? pushToken = null,
    Object? authProvider = null,
  }) {
    return _then(_value.copyWith(
      idToken: null == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      pushToken: null == pushToken
          ? _value.pushToken
          : pushToken // ignore: cast_nullable_to_non_nullable
              as String,
      authProvider: null == authProvider
          ? _value.authProvider
          : authProvider // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginRequestImplCopyWith<$Res>
    implements $LoginRequestCopyWith<$Res> {
  factory _$$LoginRequestImplCopyWith(
          _$LoginRequestImpl value, $Res Function(_$LoginRequestImpl) then) =
      __$$LoginRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_token') String idToken,
      @JsonKey(name: 'push_token') String pushToken,
      @JsonKey(name: 'auth_provider') String authProvider});
}

/// @nodoc
class __$$LoginRequestImplCopyWithImpl<$Res>
    extends _$LoginRequestCopyWithImpl<$Res, _$LoginRequestImpl>
    implements _$$LoginRequestImplCopyWith<$Res> {
  __$$LoginRequestImplCopyWithImpl(
      _$LoginRequestImpl _value, $Res Function(_$LoginRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = null,
    Object? pushToken = null,
    Object? authProvider = null,
  }) {
    return _then(_$LoginRequestImpl(
      idToken: null == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      pushToken: null == pushToken
          ? _value.pushToken
          : pushToken // ignore: cast_nullable_to_non_nullable
              as String,
      authProvider: null == authProvider
          ? _value.authProvider
          : authProvider // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginRequestImpl implements _LoginRequest {
  const _$LoginRequestImpl(
      {@JsonKey(name: 'id_token') required this.idToken,
      @JsonKey(name: 'push_token') required this.pushToken,
      @JsonKey(name: 'auth_provider') required this.authProvider});

  factory _$LoginRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginRequestImplFromJson(json);

  @override
  @JsonKey(name: 'id_token')
  final String idToken;
  @override
  @JsonKey(name: 'push_token')
  final String pushToken;
  @override
  @JsonKey(name: 'auth_provider')
  final String authProvider;

  @override
  String toString() {
    return 'LoginRequest(idToken: $idToken, pushToken: $pushToken, authProvider: $authProvider)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginRequestImpl &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.pushToken, pushToken) ||
                other.pushToken == pushToken) &&
            (identical(other.authProvider, authProvider) ||
                other.authProvider == authProvider));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idToken, pushToken, authProvider);

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      __$$LoginRequestImplCopyWithImpl<_$LoginRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginRequestImplToJson(
      this,
    );
  }
}

abstract class _LoginRequest implements LoginRequest {
  const factory _LoginRequest(
          {@JsonKey(name: 'id_token') required final String idToken,
          @JsonKey(name: 'push_token') required final String pushToken,
          @JsonKey(name: 'auth_provider') required final String authProvider}) =
      _$LoginRequestImpl;

  factory _LoginRequest.fromJson(Map<String, dynamic> json) =
      _$LoginRequestImpl.fromJson;

  @override
  @JsonKey(name: 'id_token')
  String get idToken;
  @override
  @JsonKey(name: 'push_token')
  String get pushToken;
  @override
  @JsonKey(name: 'auth_provider')
  String get authProvider;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RefreshRequest _$RefreshRequestFromJson(Map<String, dynamic> json) {
  return _RefreshRequest.fromJson(json);
}

/// @nodoc
mixin _$RefreshRequest {
  @JsonKey(name: 'refresh_token')
  String get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this RefreshRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefreshRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshRequestCopyWith<RefreshRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshRequestCopyWith<$Res> {
  factory $RefreshRequestCopyWith(
          RefreshRequest value, $Res Function(RefreshRequest) then) =
      _$RefreshRequestCopyWithImpl<$Res, RefreshRequest>;
  @useResult
  $Res call({@JsonKey(name: 'refresh_token') String refreshToken});
}

/// @nodoc
class _$RefreshRequestCopyWithImpl<$Res, $Val extends RefreshRequest>
    implements $RefreshRequestCopyWith<$Res> {
  _$RefreshRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefreshRequestImplCopyWith<$Res>
    implements $RefreshRequestCopyWith<$Res> {
  factory _$$RefreshRequestImplCopyWith(_$RefreshRequestImpl value,
          $Res Function(_$RefreshRequestImpl) then) =
      __$$RefreshRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'refresh_token') String refreshToken});
}

/// @nodoc
class __$$RefreshRequestImplCopyWithImpl<$Res>
    extends _$RefreshRequestCopyWithImpl<$Res, _$RefreshRequestImpl>
    implements _$$RefreshRequestImplCopyWith<$Res> {
  __$$RefreshRequestImplCopyWithImpl(
      _$RefreshRequestImpl _value, $Res Function(_$RefreshRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
  }) {
    return _then(_$RefreshRequestImpl(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefreshRequestImpl implements _RefreshRequest {
  const _$RefreshRequestImpl(
      {@JsonKey(name: 'refresh_token') required this.refreshToken});

  factory _$RefreshRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshRequestImplFromJson(json);

  @override
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  @override
  String toString() {
    return 'RefreshRequest(refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshRequestImpl &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, refreshToken);

  /// Create a copy of RefreshRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshRequestImplCopyWith<_$RefreshRequestImpl> get copyWith =>
      __$$RefreshRequestImplCopyWithImpl<_$RefreshRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshRequestImplToJson(
      this,
    );
  }
}

abstract class _RefreshRequest implements RefreshRequest {
  const factory _RefreshRequest(
      {@JsonKey(name: 'refresh_token')
      required final String refreshToken}) = _$RefreshRequestImpl;

  factory _RefreshRequest.fromJson(Map<String, dynamic> json) =
      _$RefreshRequestImpl.fromJson;

  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;

  /// Create a copy of RefreshRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshRequestImplCopyWith<_$RefreshRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) {
  return _SignUpResponse.fromJson(json);
}

/// @nodoc
mixin _$SignUpResponse {
  UserDTO get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  String get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this SignUpResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignUpResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpResponseCopyWith<SignUpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpResponseCopyWith<$Res> {
  factory $SignUpResponseCopyWith(
          SignUpResponse value, $Res Function(SignUpResponse) then) =
      _$SignUpResponseCopyWithImpl<$Res, SignUpResponse>;
  @useResult
  $Res call(
      {UserDTO user,
      @JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String refreshToken});

  $UserDTOCopyWith<$Res> get user;
}

/// @nodoc
class _$SignUpResponseCopyWithImpl<$Res, $Val extends SignUpResponse>
    implements $SignUpResponseCopyWith<$Res> {
  _$SignUpResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDTO,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of SignUpResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDTOCopyWith<$Res> get user {
    return $UserDTOCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SignUpResponseImplCopyWith<$Res>
    implements $SignUpResponseCopyWith<$Res> {
  factory _$$SignUpResponseImplCopyWith(_$SignUpResponseImpl value,
          $Res Function(_$SignUpResponseImpl) then) =
      __$$SignUpResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserDTO user,
      @JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String refreshToken});

  @override
  $UserDTOCopyWith<$Res> get user;
}

/// @nodoc
class __$$SignUpResponseImplCopyWithImpl<$Res>
    extends _$SignUpResponseCopyWithImpl<$Res, _$SignUpResponseImpl>
    implements _$$SignUpResponseImplCopyWith<$Res> {
  __$$SignUpResponseImplCopyWithImpl(
      _$SignUpResponseImpl _value, $Res Function(_$SignUpResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$SignUpResponseImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDTO,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignUpResponseImpl implements _SignUpResponse {
  const _$SignUpResponseImpl(
      {required this.user,
      @JsonKey(name: 'access_token') required this.accessToken,
      @JsonKey(name: 'refresh_token') required this.refreshToken});

  factory _$SignUpResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignUpResponseImplFromJson(json);

  @override
  final UserDTO user;
  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  @override
  String toString() {
    return 'SignUpResponse(user: $user, accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpResponseImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, accessToken, refreshToken);

  /// Create a copy of SignUpResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpResponseImplCopyWith<_$SignUpResponseImpl> get copyWith =>
      __$$SignUpResponseImplCopyWithImpl<_$SignUpResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpResponseImplToJson(
      this,
    );
  }
}

abstract class _SignUpResponse implements SignUpResponse {
  const factory _SignUpResponse(
          {required final UserDTO user,
          @JsonKey(name: 'access_token') required final String accessToken,
          @JsonKey(name: 'refresh_token') required final String refreshToken}) =
      _$SignUpResponseImpl;

  factory _SignUpResponse.fromJson(Map<String, dynamic> json) =
      _$SignUpResponseImpl.fromJson;

  @override
  UserDTO get user;
  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;

  /// Create a copy of SignUpResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpResponseImplCopyWith<_$SignUpResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RefreshResponse _$RefreshResponseFromJson(Map<String, dynamic> json) {
  return _RefreshResponse.fromJson(json);
}

/// @nodoc
mixin _$RefreshResponse {
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  String get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this RefreshResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefreshResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshResponseCopyWith<RefreshResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshResponseCopyWith<$Res> {
  factory $RefreshResponseCopyWith(
          RefreshResponse value, $Res Function(RefreshResponse) then) =
      _$RefreshResponseCopyWithImpl<$Res, RefreshResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String refreshToken});
}

/// @nodoc
class _$RefreshResponseCopyWithImpl<$Res, $Val extends RefreshResponse>
    implements $RefreshResponseCopyWith<$Res> {
  _$RefreshResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefreshResponseImplCopyWith<$Res>
    implements $RefreshResponseCopyWith<$Res> {
  factory _$$RefreshResponseImplCopyWith(_$RefreshResponseImpl value,
          $Res Function(_$RefreshResponseImpl) then) =
      __$$RefreshResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String refreshToken});
}

/// @nodoc
class __$$RefreshResponseImplCopyWithImpl<$Res>
    extends _$RefreshResponseCopyWithImpl<$Res, _$RefreshResponseImpl>
    implements _$$RefreshResponseImplCopyWith<$Res> {
  __$$RefreshResponseImplCopyWithImpl(
      _$RefreshResponseImpl _value, $Res Function(_$RefreshResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$RefreshResponseImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefreshResponseImpl implements _RefreshResponse {
  const _$RefreshResponseImpl(
      {@JsonKey(name: 'access_token') required this.accessToken,
      @JsonKey(name: 'refresh_token') required this.refreshToken});

  factory _$RefreshResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshResponseImplFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  @override
  String toString() {
    return 'RefreshResponse(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshResponseImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  /// Create a copy of RefreshResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshResponseImplCopyWith<_$RefreshResponseImpl> get copyWith =>
      __$$RefreshResponseImplCopyWithImpl<_$RefreshResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshResponseImplToJson(
      this,
    );
  }
}

abstract class _RefreshResponse implements RefreshResponse {
  const factory _RefreshResponse(
          {@JsonKey(name: 'access_token') required final String accessToken,
          @JsonKey(name: 'refresh_token') required final String refreshToken}) =
      _$RefreshResponseImpl;

  factory _RefreshResponse.fromJson(Map<String, dynamic> json) =
      _$RefreshResponseImpl.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;

  /// Create a copy of RefreshResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshResponseImplCopyWith<_$RefreshResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetMeResponse _$GetMeResponseFromJson(Map<String, dynamic> json) {
  return _GetMeResponse.fromJson(json);
}

/// @nodoc
mixin _$GetMeResponse {
  UserDTO get user => throw _privateConstructorUsedError;

  /// Serializes this GetMeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetMeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetMeResponseCopyWith<GetMeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetMeResponseCopyWith<$Res> {
  factory $GetMeResponseCopyWith(
          GetMeResponse value, $Res Function(GetMeResponse) then) =
      _$GetMeResponseCopyWithImpl<$Res, GetMeResponse>;
  @useResult
  $Res call({UserDTO user});

  $UserDTOCopyWith<$Res> get user;
}

/// @nodoc
class _$GetMeResponseCopyWithImpl<$Res, $Val extends GetMeResponse>
    implements $GetMeResponseCopyWith<$Res> {
  _$GetMeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetMeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDTO,
    ) as $Val);
  }

  /// Create a copy of GetMeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDTOCopyWith<$Res> get user {
    return $UserDTOCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetMeResponseImplCopyWith<$Res>
    implements $GetMeResponseCopyWith<$Res> {
  factory _$$GetMeResponseImplCopyWith(
          _$GetMeResponseImpl value, $Res Function(_$GetMeResponseImpl) then) =
      __$$GetMeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserDTO user});

  @override
  $UserDTOCopyWith<$Res> get user;
}

/// @nodoc
class __$$GetMeResponseImplCopyWithImpl<$Res>
    extends _$GetMeResponseCopyWithImpl<$Res, _$GetMeResponseImpl>
    implements _$$GetMeResponseImplCopyWith<$Res> {
  __$$GetMeResponseImplCopyWithImpl(
      _$GetMeResponseImpl _value, $Res Function(_$GetMeResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetMeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$GetMeResponseImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetMeResponseImpl implements _GetMeResponse {
  const _$GetMeResponseImpl({required this.user});

  factory _$GetMeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetMeResponseImplFromJson(json);

  @override
  final UserDTO user;

  @override
  String toString() {
    return 'GetMeResponse(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMeResponseImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of GetMeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMeResponseImplCopyWith<_$GetMeResponseImpl> get copyWith =>
      __$$GetMeResponseImplCopyWithImpl<_$GetMeResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetMeResponseImplToJson(
      this,
    );
  }
}

abstract class _GetMeResponse implements GetMeResponse {
  const factory _GetMeResponse({required final UserDTO user}) =
      _$GetMeResponseImpl;

  factory _GetMeResponse.fromJson(Map<String, dynamic> json) =
      _$GetMeResponseImpl.fromJson;

  @override
  UserDTO get user;

  /// Create a copy of GetMeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetMeResponseImplCopyWith<_$GetMeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateMeRequest _$UpdateMeRequestFromJson(Map<String, dynamic> json) {
  return _UpdateMeRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateMeRequest {
  String get nickname => throw _privateConstructorUsedError;

  /// Serializes this UpdateMeRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateMeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateMeRequestCopyWith<UpdateMeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateMeRequestCopyWith<$Res> {
  factory $UpdateMeRequestCopyWith(
          UpdateMeRequest value, $Res Function(UpdateMeRequest) then) =
      _$UpdateMeRequestCopyWithImpl<$Res, UpdateMeRequest>;
  @useResult
  $Res call({String nickname});
}

/// @nodoc
class _$UpdateMeRequestCopyWithImpl<$Res, $Val extends UpdateMeRequest>
    implements $UpdateMeRequestCopyWith<$Res> {
  _$UpdateMeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateMeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
  }) {
    return _then(_value.copyWith(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateMeRequestImplCopyWith<$Res>
    implements $UpdateMeRequestCopyWith<$Res> {
  factory _$$UpdateMeRequestImplCopyWith(_$UpdateMeRequestImpl value,
          $Res Function(_$UpdateMeRequestImpl) then) =
      __$$UpdateMeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nickname});
}

/// @nodoc
class __$$UpdateMeRequestImplCopyWithImpl<$Res>
    extends _$UpdateMeRequestCopyWithImpl<$Res, _$UpdateMeRequestImpl>
    implements _$$UpdateMeRequestImplCopyWith<$Res> {
  __$$UpdateMeRequestImplCopyWithImpl(
      _$UpdateMeRequestImpl _value, $Res Function(_$UpdateMeRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateMeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
  }) {
    return _then(_$UpdateMeRequestImpl(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateMeRequestImpl implements _UpdateMeRequest {
  const _$UpdateMeRequestImpl({required this.nickname});

  factory _$UpdateMeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateMeRequestImplFromJson(json);

  @override
  final String nickname;

  @override
  String toString() {
    return 'UpdateMeRequest(nickname: $nickname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateMeRequestImpl &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nickname);

  /// Create a copy of UpdateMeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateMeRequestImplCopyWith<_$UpdateMeRequestImpl> get copyWith =>
      __$$UpdateMeRequestImplCopyWithImpl<_$UpdateMeRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateMeRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateMeRequest implements UpdateMeRequest {
  const factory _UpdateMeRequest({required final String nickname}) =
      _$UpdateMeRequestImpl;

  factory _UpdateMeRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateMeRequestImpl.fromJson;

  @override
  String get nickname;

  /// Create a copy of UpdateMeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateMeRequestImplCopyWith<_$UpdateMeRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
