import 'package:flutter/material.dart';
import '../../services/quran_service.dart';

class SurahDetailScreen extends StatefulWidget {
  final Map surah;
  const SurahDetailScreen({super.key, required this.surah});

  @override
  State<SurahDetailScreen> createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends State<SurahDetailScreen> {
  final _service = QuranService();
  List<dynamic>? ayahs;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  Future<void> fetch() async {
    final data = await _service.getSurahAyahs(widget.surah["number"]);
    setState(() => ayahs = data);
  }

  @override
  Widget build(BuildContext context) {
    if (ayahs == null) return const Center(child: CircularProgressIndicator());
    return Scaffold(
      appBar: AppBar(title: Text(widget.surah["englishName"])),
      body: ListView.builder(
        itemCount: ayahs!.length,
        itemBuilder: (ctx, i) {
          final a = ayahs![i];
          return Card(
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(a["text"], 
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontSize: 20, fontFamily: "NotoSansArabic")),
                  const SizedBox(height: 8),
                  Text(a["text"], style: const TextStyle(color: Colors.black87)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
