import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_flavors/app/utils/color.dart';
import 'package:flutter_flavors/ui/widgets/custom_appbar.dart';
import 'package:get/get.dart';
import 'package:flutter_flavors/ui/controller/student/track_my_bus/trackmybus_controller.dart';

class TrackMyBus extends StatelessWidget {
  TrackMyBus({Key? key}) : super(key: key);

  final TrackMyBusController _controller = Get.find<TrackMyBusController>();

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
      body: GetBuilder<TrackMyBusController>(
        builder: (controller) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: controller.initialPosition,
              zoom: 14.0,
            ),
            onMapCreated: controller.onMapCreated,
            markers: controller.markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            compassEnabled: true,
            zoomControlsEnabled: false,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.student_primary,
        child: const Icon(Icons.gps_fixed),
        onPressed: _controller.animateCamera,
      ),
    );
  }
}
