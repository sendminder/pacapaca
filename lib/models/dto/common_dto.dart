// type ResponseRest struct {
// 	StatusCode int    `json:"status_code"`
// 	Message    string `json:"message"`
// 	Response   any    `json:"response,omitempty"`
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_dto.freezed.dart';
part 'common_dto.g.dart';

@Freezed(genericArgumentFactories: true)
class RestResponse<T> with _$RestResponse<T> {
  const factory RestResponse({
    @JsonKey(name: 'status_code') required int statusCode,
    required String message,
    T? response,
  }) = _RestResponse<T>;

  factory RestResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$RestResponseFromJson(json, fromJsonT);
}
