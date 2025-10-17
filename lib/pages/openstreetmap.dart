@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text("Maps"),
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      elevation: 5.0,
    ),
    body: Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: _currentLocation ?? const LatLng(0, 0),
            initialZoom: 2,
            minZoom: 0,
            maxZoom: 100,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              // Optional: You can add dark map tiles later
              // For dark mode, you might want to use different tile providers
            ),
            CurrentLocationLayer(
              style: LocationMarkerStyle(
                marker: DefaultLocationMarker(
                  child: Icon(
                    Icons.location_pin, 
                    color: Theme.of(context).brightness == Brightness.dark 
                        ? Colors.blue[200] 
                        : Colors.white,
                  ),
                ),
                markerSize: Size(35, 35),
                markerDirection: MarkerDirection.heading,
              ),
            ),
          ],
        ),
        // Add a dark mode indicator
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(
                  Theme.of(context).brightness == Brightness.dark 
                      ? Icons.dark_mode 
                      : Icons.light_mode,
                  color: Theme.of(context).colorScheme.primary,
                  size: 16,
                ),
                SizedBox(width: 5),
                Text(
                  Theme.of(context).brightness == Brightness.dark 
                      ? 'Dark' 
                      : 'Light',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
    floatingActionButton: FloatingActionButton(
      elevation: 30.0,
      onPressed: _userCurrentLocation,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      child: Icon(
        Icons.my_location, 
        size: 30.0, 
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
    ),
  );
}