import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Set up web stubs AFTER the app is initialized
    if (kIsWeb) {
      _setUpWebStubs();
    }
    
    return MaterialApp(
      title: 'WakeRide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system, // This follows system dark mode
      home: MyHomePage(),
    );
  }
}

void _setUpWebStubs() {
  // Stub for rotation sensor - use try-catch to prevent any errors
  try {
    const MethodChannel('rotation_sensor/method')
        .setMethodCallHandler((MethodCall call) async {
      return null;
    });
  } catch (e) {
    // Ignore any setup errors
  }

  // Stub for native device orientation - use empty listeners
  try {
    const EventChannel('native_device_orientation_events')
        .receiveBroadcastStream()
        .listen((event) {}, onError: (error) {}, cancelOnError: true);
  } catch (e) {
    // Ignore any setup errors
  }

  // Stub for rotation sensor orientation stream
  try {
    const EventChannel('rotation_sensor/orientation')
        .receiveBroadcastStream()
        .listen((event) {}, onError: (error) {}, cancelOnError: true);
  } catch (e) {
    // Ignore any setup errors
  }
}

// Simple home page for testing - you'll replace this with your actual home page
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WakeRide'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.nightlight_round,
              size: 50,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: 20),
            Text(
              'Dark Mode Enabled!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 10),
            Text(
              'App will follow system dark/light mode',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}