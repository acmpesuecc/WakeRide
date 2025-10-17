import 'package:flutter/material.dart';
import 'pages/openstreetmap.dart'; // ADD THIS IMPORT

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WakeRide',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: OpenstreetmapScreen(), // This should work now
    );
  }
}