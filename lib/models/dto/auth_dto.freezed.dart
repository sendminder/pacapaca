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

RequestLogin _$RequestLoginFromJson(Map<String, dynamic> json) {
  return _RequestLogin.fromJson(json);
}

/// @nodoc
mixin _$RequestLogin {
  @JsonKey(name: 'id_token')
  String get idToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'push_token')
  String get pushToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'auth_provider')
  String get authProvider => throw _privateConstructorUsedError;

  /// Serializes this RequestLogin to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestLogin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestLoginCopyWith<RequestLogin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestLoginCopyWith<$Res> {
  factory $RequestLoginCopyWith(
          RequestLogin value, $Res Function(RequestLogin) then) =
      _$RequestLoginCopyWithImpl<$Res, RequestLogin>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_token') String idToken,
      @JsonKey(name: 'push_token') String pushToken,
      @JsonKey(name: 'auth_provider') String authProvider});
}

/// @nodoc
class _$RequestLoginCopyWithImpl<$Res, $Val extends RequestLogin>
    implements $RequestLoginCopyWith<$Res> {
  _$RequestLoginCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestLogin
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
abstract class _$$RequestLoginImplCopyWith<$Res>
    implements $RequestLoginCopyWith<$Res> {
  factory _$$RequestLoginImplCopyWith(
          _$RequestLoginImpl value, $Res Function(_$RequestLoginImpl) then) =
      __$$RequestLoginImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_token') String idToken,
      @JsonKey(name: 'push_token') String pushToken,
      @JsonKey(name: 'auth_provider') String authProvider});
}

/// @nodoc
class __$$RequestLoginImplCopyWithImpl<$Res>
    extends _$RequestLoginCopyWithImpl<$Res, _$RequestLoginImpl>
    implements _$$RequestLoginImplCopyWith<$Res> {
  __$$RequestLoginImplCopyWithImpl(
      _$RequestLoginImpl _value, $Res Function(_$RequestLoginImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestLogin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = null,
    Object? pushToken = null,
    Object? authProvider = null,
  }) {
    return _then(_$RequestLoginImpl(
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
class _$RequestLoginImpl implements _RequestLogin {
  const _$RequestLoginImpl(
      {@JsonKey(name: 'id_token') required this.idToken,
      @JsonKey(name: 'push_token') required this.pushToken,
      @JsonKey(name: 'auth_provider') required this.authProvider});

  factory _$RequestLoginImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestLoginImplFromJson(json);

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
    return 'RequestLogin(idToken: $idToken, pushToken: $pushToken, authProvider: $authProvider)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestLoginImpl &&
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

  /// Create a copy of RequestLogin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestLoginImplCopyWith<_$RequestLoginImpl> get copyWith =>
      __$$RequestLoginImplCopyWithImpl<_$RequestLoginImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestLoginImplToJson(
      this,
    );
  }
}

abstract class _RequestLogin implements RequestLogin {
  const factory _RequestLogin(
          {@JsonKey(name: 'id_token') required final String idToken,
          @JsonKey(name: 'push_token') required final String pushToken,
          @JsonKey(name: 'auth_provider') required final String authProvider}) =
      _$RequestLoginImpl;

  factory _RequestLogin.fromJson(Map<String, dynamic> json) =
      _$RequestLoginImpl.fromJson;

  @override
  @JsonKey(name: 'id_token')
  String get idToken;
  @override
  @JsonKey(name: 'push_token')
  String get pushToken;
  @override
  @JsonKey(name: 'auth_provider')
  String get authProvider;

  /// Create a copy of RequestLogin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestLoginImplCopyWith<_$RequestLoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RequestRefresh _$RequestRefreshFromJson(Map<String, dynamic> json) {
  return _RequestRefresh.fromJson(json);
}

/// @nodoc
mixin _$RequestRefresh {
  @JsonKey(name: 'refresh_token')
  String get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this RequestRefresh to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestRefresh
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestRefreshCopyWith<RequestRefresh> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestRefreshCopyWith<$Res> {
  factory $RequestRefreshCopyWith(
          RequestRefresh value, $Res Function(RequestRefresh) then) =
      _$RequestRefreshCopyWithImpl<$Res, RequestRefresh>;
  @useResult
  $Res call({@JsonKey(name: 'refresh_token') String refreshToken});
}

/// @nodoc
class _$RequestRefreshCopyWithImpl<$Res, $Val extends RequestRefresh>
    implements $RequestRefreshCopyWith<$Res> {
  _$RequestRefreshCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestRefresh
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
abstract class _$$RequestRefreshImplCopyWith<$Res>
    implements $RequestRefreshCopyWith<$Res> {
  factory _$$RequestRefreshImplCopyWith(_$RequestRefreshImpl value,
          $Res Function(_$RequestRefreshImpl) then) =
      __$$RequestRefreshImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'refresh_token') String refreshToken});
}

/// @nodoc
class __$$RequestRefreshImplCopyWithImpl<$Res>
    extends _$RequestRefreshCopyWithImpl<$Res, _$RequestRefreshImpl>
    implements _$$RequestRefreshImplCopyWith<$Res> {
  __$$RequestRefreshImplCopyWithImpl(
      _$RequestRefreshImpl _value, $Res Function(_$RequestRefreshImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestRefresh
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
  }) {
    return _then(_$RequestRefreshImpl(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestRefreshImpl implements _RequestRefresh {
  const _$RequestRefreshImpl(
      {@JsonKey(name: 'refresh_token') required this.refreshToken});

  factory _$RequestRefreshImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestRefreshImplFromJson(json);

  @override
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  @override
  String toString() {
    return 'RequestRefresh(refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestRefreshImpl &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, refreshToken);

  /// Create a copy of RequestRefresh
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestRefreshImplCopyWith<_$RequestRefreshImpl> get copyWith =>
      __$$RequestRefreshImplCopyWithImpl<_$RequestRefreshImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestRefreshImplToJson(
      this,
    );
  }
}

abstract class _RequestRefresh implements RequestRefresh {
  const factory _RequestRefresh(
      {@JsonKey(name: 'refresh_token')
      required final String refreshToken}) = _$RequestRefreshImpl;

  factory _RequestRefresh.fromJson(Map<String, dynamic> json) =
      _$RequestRefreshImpl.fromJson;

  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;

  /// Create a copy of RequestRefresh
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestRefreshImplCopyWith<_$RequestRefreshImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResponseSignUp _$ResponseSignUpFromJson(Map<String, dynamic> json) {
  return _ResponseSignUp.fromJson(json);
}

/// @nodoc
mixin _$ResponseSignUp {
  UserDTO get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  String get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this ResponseSignUp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseSignUp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseSignUpCopyWith<ResponseSignUp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseSignUpCopyWith<$Res> {
  factory $ResponseSignUpCopyWith(
          ResponseSignUp value, $Res Function(ResponseSignUp) then) =
      _$ResponseSignUpCopyWithImpl<$Res, ResponseSignUp>;
  @useResult
  $Res call(
      {UserDTO user,
      @JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String refreshToken});

  $UserDTOCopyWith<$Res> get user;
}

/// @nodoc
class _$ResponseSignUpCopyWithImpl<$Res, $Val extends ResponseSignUp>
    implements $ResponseSignUpCopyWith<$Res> {
  _$ResponseSignUpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseSignUp
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

  /// Create a copy of ResponseSignUp
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
abstract class _$$ResponseSignUpImplCopyWith<$Res>
    implements $ResponseSignUpCopyWith<$Res> {
  factory _$$ResponseSignUpImplCopyWith(_$ResponseSignUpImpl value,
          $Res Function(_$ResponseSignUpImpl) then) =
      __$$ResponseSignUpImplCopyWithImpl<$Res>;
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
class __$$ResponseSignUpImplCopyWithImpl<$Res>
    extends _$ResponseSignUpCopyWithImpl<$Res, _$ResponseSignUpImpl>
    implements _$$ResponseSignUpImplCopyWith<$Res> {
  __$$ResponseSignUpImplCopyWithImpl(
      _$ResponseSignUpImpl _value, $Res Function(_$ResponseSignUpImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseSignUp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$ResponseSignUpImpl(
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
class _$ResponseSignUpImpl implements _ResponseSignUp {
  const _$ResponseSignUpImpl(
      {required this.user,
      @JsonKey(name: 'access_token') required this.accessToken,
      @JsonKey(name: 'refresh_token') required this.refreshToken});

  factory _$ResponseSignUpImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseSignUpImplFromJson(json);

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
    return 'ResponseSignUp(user: $user, accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseSignUpImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, accessToken, refreshToken);

  /// Create a copy of ResponseSignUp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseSignUpImplCopyWith<_$ResponseSignUpImpl> get copyWith =>
      __$$ResponseSignUpImplCopyWithImpl<_$ResponseSignUpImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseSignUpImplToJson(
      this,
    );
  }
}

abstract class _ResponseSignUp implements ResponseSignUp {
  const factory _ResponseSignUp(
          {required final UserDTO user,
          @JsonKey(name: 'access_token') required final String accessToken,
          @JsonKey(name: 'refresh_token') required final String refreshToken}) =
      _$ResponseSignUpImpl;

  factory _ResponseSignUp.fromJson(Map<String, dynamic> json) =
      _$ResponseSignUpImpl.fromJson;

  @override
  UserDTO get user;
  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;

  /// Create a copy of ResponseSignUp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseSignUpImplCopyWith<_$ResponseSignUpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResponseRefresh _$ResponseRefreshFromJson(Map<String, dynamic> json) {
  return _ResponseRefresh.fromJson(json);
}

/// @nodoc
mixin _$ResponseRefresh {
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  String get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this ResponseRefresh to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseRefresh
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseRefreshCopyWith<ResponseRefresh> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseRefreshCopyWith<$Res> {
  factory $ResponseRefreshCopyWith(
          ResponseRefresh value, $Res Function(ResponseRefresh) then) =
      _$ResponseRefreshCopyWithImpl<$Res, ResponseRefresh>;
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String refreshToken});
}

/// @nodoc
class _$ResponseRefreshCopyWithImpl<$Res, $Val extends ResponseRefresh>
    implements $ResponseRefreshCopyWith<$Res> {
  _$ResponseRefreshCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseRefresh
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
abstract class _$$ResponseRefreshImplCopyWith<$Res>
    implements $ResponseRefreshCopyWith<$Res> {
  factory _$$ResponseRefreshImplCopyWith(_$ResponseRefreshImpl value,
          $Res Function(_$ResponseRefreshImpl) then) =
      __$$ResponseRefreshImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String refreshToken});
}

/// @nodoc
class __$$ResponseRefreshImplCopyWithImpl<$Res>
    extends _$ResponseRefreshCopyWithImpl<$Res, _$ResponseRefreshImpl>
    implements _$$ResponseRefreshImplCopyWith<$Res> {
  __$$ResponseRefreshImplCopyWithImpl(
      _$ResponseRefreshImpl _value, $Res Function(_$ResponseRefreshImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseRefresh
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$ResponseRefreshImpl(
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
class _$ResponseRefreshImpl implements _ResponseRefresh {
  const _$ResponseRefreshImpl(
      {@JsonKey(name: 'access_token') required this.accessToken,
      @JsonKey(name: 'refresh_token') required this.refreshToken});

  factory _$ResponseRefreshImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseRefreshImplFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  @override
  String toString() {
    return 'ResponseRefresh(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseRefreshImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  /// Create a copy of ResponseRefresh
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseRefreshImplCopyWith<_$ResponseRefreshImpl> get copyWith =>
      __$$ResponseRefreshImplCopyWithImpl<_$ResponseRefreshImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseRefreshImplToJson(
      this,
    );
  }
}

abstract class _ResponseRefresh implements ResponseRefresh {
  const factory _ResponseRefresh(
          {@JsonKey(name: 'access_token') required final String accessToken,
          @JsonKey(name: 'refresh_token') required final String refreshToken}) =
      _$ResponseRefreshImpl;

  factory _ResponseRefresh.fromJson(Map<String, dynamic> json) =
      _$ResponseRefreshImpl.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;

  /// Create a copy of ResponseRefresh
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseRefreshImplCopyWith<_$ResponseRefreshImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResponseGetMe _$ResponseGetMeFromJson(Map<String, dynamic> json) {
  return _ResponseGetMe.fromJson(json);
}

/// @nodoc
mixin _$ResponseGetMe {
  UserDTO get user => throw _privateConstructorUsedError;

  /// Serializes this ResponseGetMe to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseGetMe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseGetMeCopyWith<ResponseGetMe> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseGetMeCopyWith<$Res> {
  factory $ResponseGetMeCopyWith(
          ResponseGetMe value, $Res Function(ResponseGetMe) then) =
      _$ResponseGetMeCopyWithImpl<$Res, ResponseGetMe>;
  @useResult
  $Res call({UserDTO user});

  $UserDTOCopyWith<$Res> get user;
}

/// @nodoc
class _$ResponseGetMeCopyWithImpl<$Res, $Val extends ResponseGetMe>
    implements $ResponseGetMeCopyWith<$Res> {
  _$ResponseGetMeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseGetMe
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

  /// Create a copy of ResponseGetMe
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
abstract class _$$ResponseGetMeImplCopyWith<$Res>
    implements $ResponseGetMeCopyWith<$Res> {
  factory _$$ResponseGetMeImplCopyWith(
          _$ResponseGetMeImpl value, $Res Function(_$ResponseGetMeImpl) then) =
      __$$ResponseGetMeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserDTO user});

  @override
  $UserDTOCopyWith<$Res> get user;
}

/// @nodoc
class __$$ResponseGetMeImplCopyWithImpl<$Res>
    extends _$ResponseGetMeCopyWithImpl<$Res, _$ResponseGetMeImpl>
    implements _$$ResponseGetMeImplCopyWith<$Res> {
  __$$ResponseGetMeImplCopyWithImpl(
      _$ResponseGetMeImpl _value, $Res Function(_$ResponseGetMeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseGetMe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$ResponseGetMeImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseGetMeImpl implements _ResponseGetMe {
  const _$ResponseGetMeImpl({required this.user});

  factory _$ResponseGetMeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseGetMeImplFromJson(json);

  @override
  final UserDTO user;

  @override
  String toString() {
    return 'ResponseGetMe(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseGetMeImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of ResponseGetMe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseGetMeImplCopyWith<_$ResponseGetMeImpl> get copyWith =>
      __$$ResponseGetMeImplCopyWithImpl<_$ResponseGetMeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseGetMeImplToJson(
      this,
    );
  }
}

abstract class _ResponseGetMe implements ResponseGetMe {
  const factory _ResponseGetMe({required final UserDTO user}) =
      _$ResponseGetMeImpl;

  factory _ResponseGetMe.fromJson(Map<String, dynamic> json) =
      _$ResponseGetMeImpl.fromJson;

  @override
  UserDTO get user;

  /// Create a copy of ResponseGetMe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseGetMeImplCopyWith<_$ResponseGetMeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RequestUpdateMe _$RequestUpdateMeFromJson(Map<String, dynamic> json) {
  return _RequestUpdateMe.fromJson(json);
}

/// @nodoc
mixin _$RequestUpdateMe {
  String? get nickname => throw _privateConstructorUsedError;
  String? get profileType => throw _privateConstructorUsedError;
  String? get badgeType => throw _privateConstructorUsedError;

  /// Serializes this RequestUpdateMe to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestUpdateMe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestUpdateMeCopyWith<RequestUpdateMe> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestUpdateMeCopyWith<$Res> {
  factory $RequestUpdateMeCopyWith(
          RequestUpdateMe value, $Res Function(RequestUpdateMe) then) =
      _$RequestUpdateMeCopyWithImpl<$Res, RequestUpdateMe>;
  @useResult
  $Res call({String? nickname, String? profileType, String? badgeType});
}

/// @nodoc
class _$RequestUpdateMeCopyWithImpl<$Res, $Val extends RequestUpdateMe>
    implements $RequestUpdateMeCopyWith<$Res> {
  _$RequestUpdateMeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestUpdateMe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = freezed,
    Object? profileType = freezed,
    Object? badgeType = freezed,
  }) {
    return _then(_value.copyWith(
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      profileType: freezed == profileType
          ? _value.profileType
          : profileType // ignore: cast_nullable_to_non_nullable
              as String?,
      badgeType: freezed == badgeType
          ? _value.badgeType
          : badgeType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestUpdateMeImplCopyWith<$Res>
    implements $RequestUpdateMeCopyWith<$Res> {
  factory _$$RequestUpdateMeImplCopyWith(_$RequestUpdateMeImpl value,
          $Res Function(_$RequestUpdateMeImpl) then) =
      __$$RequestUpdateMeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? nickname, String? profileType, String? badgeType});
}

/// @nodoc
class __$$RequestUpdateMeImplCopyWithImpl<$Res>
    extends _$RequestUpdateMeCopyWithImpl<$Res, _$RequestUpdateMeImpl>
    implements _$$RequestUpdateMeImplCopyWith<$Res> {
  __$$RequestUpdateMeImplCopyWithImpl(
      _$RequestUpdateMeImpl _value, $Res Function(_$RequestUpdateMeImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestUpdateMe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = freezed,
    Object? profileType = freezed,
    Object? badgeType = freezed,
  }) {
    return _then(_$RequestUpdateMeImpl(
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      profileType: freezed == profileType
          ? _value.profileType
          : profileType // ignore: cast_nullable_to_non_nullable
              as String?,
      badgeType: freezed == badgeType
          ? _value.badgeType
          : badgeType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestUpdateMeImpl implements _RequestUpdateMe {
  const _$RequestUpdateMeImpl(
      {this.nickname, this.profileType, this.badgeType});

  factory _$RequestUpdateMeImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestUpdateMeImplFromJson(json);

  @override
  final String? nickname;
  @override
  final String? profileType;
  @override
  final String? badgeType;

  @override
  String toString() {
    return 'RequestUpdateMe(nickname: $nickname, profileType: $profileType, badgeType: $badgeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestUpdateMeImpl &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.profileType, profileType) ||
                other.profileType == profileType) &&
            (identical(other.badgeType, badgeType) ||
                other.badgeType == badgeType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, nickname, profileType, badgeType);

  /// Create a copy of RequestUpdateMe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestUpdateMeImplCopyWith<_$RequestUpdateMeImpl> get copyWith =>
      __$$RequestUpdateMeImplCopyWithImpl<_$RequestUpdateMeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestUpdateMeImplToJson(
      this,
    );
  }
}

abstract class _RequestUpdateMe implements RequestUpdateMe {
  const factory _RequestUpdateMe(
      {final String? nickname,
      final String? profileType,
      final String? badgeType}) = _$RequestUpdateMeImpl;

  factory _RequestUpdateMe.fromJson(Map<String, dynamic> json) =
      _$RequestUpdateMeImpl.fromJson;

  @override
  String? get nickname;
  @override
  String? get profileType;
  @override
  String? get badgeType;

  /// Create a copy of RequestUpdateMe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestUpdateMeImplCopyWith<_$RequestUpdateMeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
