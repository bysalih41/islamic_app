import 'package:flutter/material.dart';
import '../../services/prayer_service.dart';

class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({super.key});
  @override
  State<PrayerTimesScreen> createState() => _PrayerTimesScreenState();
}
class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  final _service = PrayerService();
  Map<String, dynamic>? times;
  @override
  void initState() {
    super.initState();
    load();
  }
  void load() async {
    final t = await _service.getTimes("Ankara", "Turkey");
    setState(() => times = t);
  }
  @override
  Widget build(BuildContext context) {
    if (times == null) return const Center(child: CircularProgressIndicator());
    return ListView(
      children: [
        _tile("İmsak", times!["Fajr"]),
        _tile("Güneş", times!["Sunrise"]),
        _tile("Öğle", times!["Dhuhr"]),
        _tile("İkindi", times!["Asr"]),
        _tile("Akşam", times!["Maghrib"]),
        _tile("Yatsı", times!["Isha"]),
      ],
    );
  }
  Widget _tile(String t, String v) => ListTile(title: Text(t), trailing: Text(v));
}
