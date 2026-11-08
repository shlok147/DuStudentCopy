import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddOnController extends GetxController {
  var selectedAddOns = <bool>[false, false, false].obs;
}

class AddOnPage extends StatelessWidget {
  final AddOnController controller = Get.put(AddOnController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reactive Checkboxes")),
      body: Center(
        child: Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return CheckboxListTile(
              title: Text('Add-On ${index + 1}'),
              value: controller.selectedAddOns[index],
              onChanged: (val) {
                controller.selectedAddOns[index] = val!;
              },
            );
          }),
        )),
      ),
    );
  }
}
