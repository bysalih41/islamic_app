import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math' as math;

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});
  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  double heading = 0;
  double? qibla;

  @override
  void initState() {
    super.initState();
    _determinePosition();
    FlutterCompass.events?.listen((event) {
      setState(() => heading = event.heading ?? 0);
    });
  }

  Future<void> _determinePosition() async {
    final pos = await Geolocator.getCurrentPosition();
    setState(() => qibla = _calcQibla(pos.latitude, pos.longitude));
  }

  double _calcQibla(double lat, double lng) {
    const kaabaLat = 21.4225 * math.pi / 180;
    const kaabaLng = 39.8262 * math.pi / 180;
    final userLat = lat * math.pi / 180;
    final userLng = lng * math.pi / 180;
    final dLng = kaabaLng - userLng;
    final y = math.sin(dLng);
    final x = math.cos(userLat) * math.tan(kaabaLat) - math.sin(userLat) * math.cos(dLng);
    return (math.atan2(y, x) * 180 / math.pi + 360) % 360;
  }

  @override
  Widget build(BuildContext context) {
    if (qibla == null) return const Center(child: CircularProgressIndicator());
    final diff = qibla! - heading;
    return Scaffold(
      appBar: AppBar(title: const Text("Kıble Bulucu")),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Cihaz yönü: ${heading.toStringAsFixed(0)}°"),
          Text("Kıble yönü: ${qibla!.toStringAsFixed(0)}°"),
          const SizedBox(height:20),
          const Text("Çevirerek yeşil ok ile cihaz yönünü üst üste getir 🕋")
        ]),
      ),
    );
  }
}
