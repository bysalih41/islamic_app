import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          CircleAvatar(radius: 50, backgroundColor: Colors.blue),
          SizedBox(height: 20),
          Text("Kullanıcı Adı", textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text("Ankara, Türkiye", textAlign: TextAlign.center),
          Divider(),
          ListTile(title: Text("Hedefler"), subtitle: Text("Kur’an okuma, dua ezberleme vs.")),
          ListTile(title: Text("Başarımlar"), subtitle: Text("Namaz takibi, zikirmatik kullanımı vs.")),
        ],
      ),
    );
  }
}
