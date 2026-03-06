import 'dart:async';
import 'package:sensors_plus/sensors_plus.dart';

class SensorService {
  StreamSubscription? _subscription;

  void startListening(Function onShake) {
    _subscription = accelerometerEvents.listen((event) {

      double x = event.x;
      double y = event.y;
      double z = event.z;

      double acceleration = (x * x + y * y + z * z);

      if (acceleration > 200) {
        onShake();
      }

    });
  }

  void stopListening() {
    _subscription?.cancel();
  }
}