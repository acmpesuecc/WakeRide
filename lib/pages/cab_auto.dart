import 'package:flutter/material.dart';
import 'package:bus_app/pages/ringtones.dart';
import 'package:bus_app/pages/openstreetmap.dart';


class OpenStreetMapsButton extends StatelessWidget {
  const OpenStreetMapsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'OpenStreetMaps',
      hint: 'Opens the map screen',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => OpenstreetmapScreen()),
            );
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple.shade400, Colors.purple.shade600],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.map_rounded, color: Colors.white, size: 22),
                  const SizedBox(width: 10),
                  Text(
                    'OpenStreetMaps',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class BusmetroPage extends StatefulWidget {
  const BusmetroPage({super.key});
  @override
  State<BusmetroPage> createState() => _BusmetroPageState();
}

class _BusmetroPageState extends State<BusmetroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Bus/Metro"),
        surfaceTintColor: Colors.purple,
        elevation: 5.0,
        shadowColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const OpenStreetMapsButton(),

              OutlinedButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(Colors.black),
                ),
                onPressed: () async {
                  final selectedRingtone = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RingtonesPage(),
                    ),
                  );
                  if (selectedRingtone != null) {
                    debugPrint('Selected Ringtone: $selectedRingtone');
                  }
                },
                child: Text(
                  "Select Ringtone",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    decorationColor: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}