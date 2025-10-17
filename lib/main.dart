import 'package:bus_app/pages/home.dart';
import 'package:bus_app/pages/openstreetmap.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OpenstreetmapScreen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.oswald(
            fontSize: 32.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        fontFamily: 'Gilroy',
      ),
    );
  }
}

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg image.png'), 
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}