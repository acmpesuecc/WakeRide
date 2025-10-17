import 'package:flutter/material.dart';
import 'package:bus_app/pages/ringtones.dart';
import 'package:bus_app/pages/openstreetmap.dart';

/// Style configuration shared by both buttons (White fill, Black border/text)
final ButtonStyle _sharedButtonStyle = OutlinedButton.styleFrom(
  backgroundColor: Colors.white,
  foregroundColor: Colors.black, // Black text and icon color
  padding: const EdgeInsets.symmetric(vertical: 18), 
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
  // Thick black border to match the image
  side: const BorderSide(color: Colors.black, width: 2.0), 
  elevation: 0, // No shadow for a cleaner look
);


/// A button styled as an OutlinedButton with a clean, high-contrast look.
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
          style: _sharedButtonStyle, // Apply shared style
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => OpenstreetmapScreen()),
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

/// The main Bus/Metro screen displaying action buttons.
class BusmetroPage extends StatefulWidget {
  const BusmetroPage({super.key});
  @override
  State<BusmetroPage> createState() => _BusmetroPageState();
}

class _BusmetroPageState extends State<BusmetroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Bus/Metro",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87), // Dark text
        ),
        // Custom light purple color to match the image header
        backgroundColor: const Color(0xFFE6E0F1), 
        elevation: 0, // Flat app bar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch, 
            children: [
              // Removed SizedBox(height: 16) to rely on the 24.0 padding

              const OpenStreetMapsButton(),
              
              // Consistent vertical spacing between buttons as indicated by '24'
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: _sharedButtonStyle, // Apply shared style
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
