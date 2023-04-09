import 'package:http/http.dart' as http;

class HttpCall {
  static final Map<String, String> _header = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
  static const String _baseLink = "https://craftybay.teamrabbil.com/api";
  static const Duration _timeout = Duration(seconds: 10);

  static Future<http.Response> get(String url) async {
    return await http.get(Uri.parse(_baseLink + url), headers: _header).timeout(_timeout);
  }
}
