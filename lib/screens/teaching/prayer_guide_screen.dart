import 'package:flutter/material.dart';

class PrayerGuideScreen extends StatelessWidget {
  const PrayerGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Namaz Öğretimi")),
      body: ListView(
        children: const [
          ListTile(title: Text("Sabah Namazı"), subtitle: Text("Nasıl kılınır")),
          ListTile(title: Text("Öğle Namazı"), subtitle: Text("Nasıl kılınır")),
          ListTile(title: Text("İkindi Namazı")),
          ListTile(title: Text("Akşam Namazı")),
          ListTile(title: Text("Yatsı Namazı")),
          Divider(),
          ListTile(title: Text("Seferilikte Namaz")),
          ListTile(title: Text("Cemaatle Namaz")),
        ],
      ),
    );
  }
}
