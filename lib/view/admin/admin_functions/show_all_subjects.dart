import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_flavors/controller/adminscreen/adminscreen_controller.dart';

class ShowAllSubjects extends StatelessWidget {
  const ShowAllSubjects({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AdminScreenController>();

    return Obx(() {
      if (controller.subjects.isEmpty) {
        return const Center(child: Text("No subjects available."));
      }

      return Expanded(
        child: ListView.builder(
          itemCount: controller.subjects.length,
          itemBuilder: (context, index) {
            final subject = controller.subjects[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(subject.name),
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              ),
            );
          },
        ),
      );
    });
  }
}
