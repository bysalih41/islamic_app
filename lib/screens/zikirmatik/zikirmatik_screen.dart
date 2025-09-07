import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ZikirmatikScreen extends StatefulWidget {
  const ZikirmatikScreen({super.key});
  @override
  State<ZikirmatikScreen> createState() => _ZikirmatikScreenState();
}

class _ZikirmatikScreenState extends State<ZikirmatikScreen> {
  late Box box;
  int counter = 0;

  @override
  void initState() {
    super.initState();
    box = Hive.box("zikirmatik");
    counter = box.get("count", defaultValue: 0);
  }

  void increment() {
    setState(() {
      counter++;
      box.put("count", counter);
    });
  }

  void reset() {
    setState(() {
      counter = 0;
      box.put("count", counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Zikirmatik")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$counter", style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: increment, child: const Text("Zikret +1")),
            ElevatedButton(onPressed: reset, child: const Text("Sıfırla")),
          ],
        ),
      ),
    );
  }
}
