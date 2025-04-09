import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackMyBusController extends GetxController {
  late GoogleMapController mapController;
  final LatLng _initialPosition = const LatLng(21.121560181874734, 79.10495623649487);
  final Set<Marker> _markers = {};

  // getter for initialPosition
  LatLng get initialPosition => _initialPosition;

  Set<Marker> get markers => _markers;

  @override
  void onInit() {
    super.onInit();
    _addMarkers();
  }

  void _addMarkers() {
    _markers.add(
      Marker(
        markerId: const MarkerId('bus_location'),
        position: _initialPosition,
        infoWindow: const InfoWindow(
          title: 'Your Bus',
          snippet: 'Current location',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ),
      ),
    );
    update(); // Notify listeners to rebuild the UI
  }

  // Method to animate the camera to the initial position when the FAB is pressed
  void animateCamera() {
    mapController.animateCamera(
      CameraUpdate.newLatLng(_initialPosition),
    );
  }

  // Method to handle the map controller after creation
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
