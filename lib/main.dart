import 'package:flutter/material.dart';
import 'screens/prayer_times/prayer_times_screen.dart';
import 'screens/quran/quran_screen.dart';
import 'screens/qibla/qibla_screen.dart';
import 'screens/zikirmatik/zikirmatik_screen.dart';
import 'screens/settings/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'İslami Yaşam',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;
  final _pages = const [
    PrayerTimesScreen(),
    QuranScreen(),
    QiblaScreen(),
    ZikirmatikScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.schedule), label: "Vakitler"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Kur’an"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Kıble"),
          BottomNavigationBarItem(icon: Icon(Icons.all_inclusive), label: "Zikirmatik"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Ayarlar"),
        ],
      ),
    );
  }
}
