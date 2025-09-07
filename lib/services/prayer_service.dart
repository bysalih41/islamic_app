import 'dart:convert';
import 'package:http/http.dart' as http;

class PrayerService {
  final _base = "https://api.aladhan.com/v1";

  Future<Map<String, dynamic>> getTimes(String city, String country) async {
    final url = Uri.parse("$_base/timingsByCity?city=$city&country=$country&method=13");
    final res = await http.get(url);
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      return data["data"]["timings"];
    }
    throw Exception("Namaz vakitleri alınamadı");
  }
}
