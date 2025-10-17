import 'package:flutter/material.dart';
import 'package:bus_app/pages/ringtones.dart';
import 'package:bus_app/pages/openstreetmap.dart';

/// Shared style for both buttons — white background, black border/text
final ButtonStyle _sharedButtonStyle = OutlinedButton.styleFrom(
  backgroundColor: Colors.white,
  foregroundColor: Colors.black,
  padding: const EdgeInsets.symmetric(vertical: 18),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
  side: const BorderSide(color: Colors.black, width: 2.0),
);

/// A button styled as an OutlinedButton with a simple white/black theme
class OpenStreetMapsButton extends StatelessWidget {
  const OpenStreetMapsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Semantics(
        button: true,
        label: 'OpenStreetMaps',
        hint: 'Opens the map screen',
        child: OutlinedButton(
          style: _sharedButtonStyle,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const OpenstreetmapScreen()),
            );
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.map_rounded, size: 22),
              SizedBox(width: 12),
              Text(
                'OpenStreetMaps',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The main Cab/Auto page — same UI style as Bus/Metro
class CabAutoPage extends StatefulWidget {
  const CabAutoPage({super.key});
  @override
  State<CabAutoPage> createState() => _CabAutoPageState();
}

class _CabAutoPageState extends State<CabAutoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Cab/Auto",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        backgroundColor: const Color(0xFFE6E0F1), // same light purple as Bus/Metro
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const OpenStreetMapsButton(),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: _sharedButtonStyle,
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
                  child: const Text(
                    "Select Ringtone",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      letterSpacing: 0.5,
                    ),
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
