import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ayarlar")),
      body: ListView(
        children: const [
          ListTile(title: Text("Bildirimler")),
          ListTile(title: Text("Tema Seçimi")),
          ListTile(title: Text("Ezan Sesi")),
          ListTile(title: Text("Hakkında")),
        ],
      ),
    );
  }
}
