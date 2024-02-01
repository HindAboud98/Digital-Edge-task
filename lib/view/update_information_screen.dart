import 'package:country_code_picker/country_code_picker.dart';
import 'package:digital_edge_task/controllers/update_information_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateInformationScreen extends GetView<UpdateInformationController> {
  const UpdateInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Information"),
        automaticallyImplyLeading: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        child: ListView(
          children: [
            TextField(
              controller: controller.nameCtrl,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15 ,),
            TextField(
              controller: controller.phoneCtrl,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 70),
                prefixIcon: CountryCodePicker(
                  initialSelection: controller.user!.countryCode,
                  padding: EdgeInsets.zero,
                  hideMainText: true,
                  onChanged: controller.onCountryChanged,
                ),
              ),
            ),
            const SizedBox(height: 15 ,),
            TextField(
              controller: controller.emailCtrl,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30 ,),
            Obx(() => controller.isLoading ? const Center(child: CircularProgressIndicator(),) :FilledButton(onPressed: controller.save, child: const Text("Save",),),),
          ],
        ),
      ),
    );
  }
}
