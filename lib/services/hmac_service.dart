import 'dart:convert';
import 'package:crypto/crypto.dart';

class HMACUtil {
  final String secretKey;

  HMACUtil(this.secretKey);

  // HMAC 서명 생성 함수
  String generateHMACSignature(String message, String timestamp) {
    final key = utf8.encode(secretKey);
    final fullMessage = utf8.encode(message + timestamp);

    final hmacSha256 = Hmac(sha256, key);
    final digest = hmacSha256.convert(fullMessage);

    return base64Encode(digest.bytes);
  }
}
