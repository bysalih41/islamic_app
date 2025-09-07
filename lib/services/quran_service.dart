import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive_flutter/hive_flutter.dart';

class QuranService {
  final _base = "https://api.alquran.cloud/v1";
  final _cache = Hive.box("quran_cache");

  Future<List<dynamic>> getSurahs() async {
    final res = await http.get(Uri.parse("$_base/surah"));
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      return data["data"];
    }
    throw Exception("Sure listesi alınamadı");
  }

  Future<List<dynamic>> getSurahAyahs(int id) async {
    if (_cache.containsKey("surah_$id")) return _cache.get("surah_$id");
    final res = await http.get(Uri.parse("$_base/surah/$id/tr.diyanet"));
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      final ayahs = data["data"]["ayahs"];
      await _cache.put("surah_$id", ayahs);
      return ayahs;
    }
    throw Exception("Ayetler alınamadı");
  }
}
