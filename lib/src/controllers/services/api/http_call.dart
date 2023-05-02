import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HttpCall {
  static const Map<String, String> _header = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
  static const String _baseLink = "https://craftybay.teamrabbil.com/api";
  static const Duration _timeout = Duration(seconds: 10);

  static Future<http.Response> get(String url, {String token = ''}) async {
    final Map<String, String> header = {};
    header.addAll(_header);
    if (token.isNotEmpty) header.addAll({"token": token});

    if (kDebugMode) print("Requesting:------------------------------------------");
    header.forEach((key, value) {
      if (kDebugMode) print("$key: $value");
    });

    return await http.get(Uri.parse(_baseLink + url), headers: header).timeout(_timeout);
  }
}
