// sensor_page.dart
import 'package:flutter/material.dart';

class SensorPage extends StatelessWidget {
  const SensorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sensor Data'),
      ),
      body: Center(
        child: Text('Sensor data will be displayed here'),
      ),
    );
  }
}