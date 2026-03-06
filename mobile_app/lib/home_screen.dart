import 'package:flutter/material.dart';
import 'services/sensor_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool safetyMode = false;
  final SensorService sensorService = SensorService();
    void toggleSafety() {
    setState(() {
        safetyMode = !safetyMode;
    });

    if (safetyMode) {
        sensorService.startListening(() {
        distressDetected();
        });
    } else {
        sensorService.stopListening();
    }
    }

        void distressDetected() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
        title: const Text("⚠ DISTRESS DETECTED"),
        content: const Text("Recording Evidence Capsule..."),
        actions: [
            TextButton(
            onPressed: () {
                Navigator.pop(context);
            },
            child: const Text("OK"),
            )
        ],
        ),
    );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: safetyMode ? Colors.red[50] : Colors.white,
      appBar: AppBar(
        title: const Text("Emergency Evidence Capsule"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              safetyMode ? Icons.warning : Icons.shield,
              size: 100,
              color: safetyMode ? Colors.red : Colors.green,
            ),

            const SizedBox(height: 20),

            Text(
              safetyMode ? "Safety Mode ACTIVE" : "Safety Mode OFF",
              style: const TextStyle(fontSize: 24),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: toggleSafety,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 20),
              ),
              child: Text(
                safetyMode ? "DISARM SAFETY MODE" : "ARM SAFETY MODE",
                style: const TextStyle(fontSize: 18),
              ),
            ),

            const SizedBox(height: 40),

            if (safetyMode)
              const Text(
                "Monitoring sensors for distress...",
                style: TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}