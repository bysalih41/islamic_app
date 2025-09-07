import 'package:flutter/material.dart';
import '../../services/quran_service.dart';
import 'surah_detail_screen.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  final _service = QuranService();
  List<dynamic>? surahs;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  Future<void> fetch() async {
    final data = await _service.getSurahs();
    setState(() => surahs = data);
  }

  @override
  Widget build(BuildContext context) {
    if (surahs == null) return const Center(child: CircularProgressIndicator());
    return ListView.builder(
      itemCount: surahs!.length,
      itemBuilder: (ctx, i) {
        final s = surahs![i];
        return ListTile(
          leading: CircleAvatar(child: Text("${s['number']}")),
          title: Text("${s['englishName']} — ${s['name']}"),
          subtitle: Text("${s['revelationType']} • ${s['numberOfAyahs']} ayet"),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SurahDetailScreen(surah: s),
              ),
            );
          },
        );
      },
    );
  }
}
