// type ResponseRest struct {
// 	StatusCode int    `json:"status_code"`
// 	Message    string `json:"message"`
// 	Response   any    `json:"response,omitempty"`
// }

class ResponseRest<T> {
  final int statusCode;
  final String message;
  final T? response;

  ResponseRest({
    required this.statusCode,
    required this.message,
    this.response,
  });

  factory ResponseRest.fromJson(Map<String, dynamic> json) => ResponseRest(
        statusCode: json['status_code'],
        message: json['message'],
        response: json['response'],
      );
}
