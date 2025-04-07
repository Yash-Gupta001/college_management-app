import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/ui/widgets/custom_appbar.dart';

class TrackMyBus extends StatefulWidget {
  TrackMyBus({Key? key}) : super(key: key);

  @override
  _TrackMyBusState createState() => _TrackMyBusState();
}

class _TrackMyBusState extends State<TrackMyBus> {
  late GoogleMapController mapController;
  final LatLng _initialPosition = const LatLng(37.7749, -122.4194);
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _addMarkers();
  }

  void _addMarkers() {
    setState(() {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Track My Bus',
        titleColor: AppColors.white,
        backgroundColor: AppColors.student_primary,
        automaticallyImplyLeading: true,
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 14.0,
        ),
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
        markers: _markers,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        compassEnabled: true,
        zoomControlsEnabled: false,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.student_primary,
        child: const Icon(Icons.gps_fixed),
        onPressed: () {
          mapController.animateCamera(
            CameraUpdate.newLatLng(_initialPosition),
          );
        },
      ),
    );
  }
}