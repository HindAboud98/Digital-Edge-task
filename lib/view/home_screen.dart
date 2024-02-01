import 'package:digital_edge_task/controllers/home_screen_controller.dart';
import 'package:digital_edge_task/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Obx(() => controller.userInfo == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.person_outline),
                        title: Text(
                          controller.userInfo?.name ?? "",
                          style: TextStyle(fontSize: 16, color: secondaryColor),
                        ),
                      ),
                      ListTile(
                          leading: const Icon(Icons.phone_android_outlined),
                          title: Text(controller.userInfo?.phone ?? "",style: TextStyle(fontSize: 16, color: secondaryColor),)),
                      ListTile(
                          leading: const Icon(Icons.email_outlined),
                          title: Text(controller.userInfo?.email ?? "",style: TextStyle(fontSize: 16, color: secondaryColor),)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text(
                          "Update Information",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                        onTap: controller.onUpdateInfoTapped,
                      ),
                      const ListTile(
                          title: Text(
                            "Change Password",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios_outlined)),
                      const ListTile(
                          title: Text(
                            "Delete Account",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios_outlined)),
                      const ListTile(
                          title: Text(
                            "Logout",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios_outlined)),
                    ],
                  ),
                ),
              ],
            )),
    );
  }
}
