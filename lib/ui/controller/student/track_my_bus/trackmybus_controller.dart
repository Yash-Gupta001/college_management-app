import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_flavors/app/utils/color.dart';


class TrackMyBusController extends GetxController {
  late GoogleMapController mapController;
  final LatLng _initialPosition = const LatLng(21.121560181874734, 79.10495623649487);
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {}; // Set to store polylines

  // getter for initialPosition
  LatLng get initialPosition => _initialPosition;

  Set<Marker> get markers => _markers;
  Set<Polyline> get polylines => _polylines; // Getter for polylines

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
    update();
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

  // Method to add polyline from the user's current location to the bus's initial position
  Future<void> addPolylineFromUserToBus() async {
    // Get the user's current location
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // Create a LatLng for the user's current location
    LatLng userLocation = LatLng(position.latitude, position.longitude);

    // Add a new polyline to the set, connecting the user's location to the bus's location
    _polylines.add(
      Polyline(
        polylineId: PolylineId('user_to_bus'),
        points: [userLocation, _initialPosition],
        color: AppColors.google_blue, // Choose color of polyline
        width: 5, // Line width
      ),
    );

    update(); // Notify listeners to update the map
  }
}
