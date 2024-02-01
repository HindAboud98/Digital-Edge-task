import 'package:digital_edge_task/controllers/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/ali_fouad_logo.png",height: Get.height / 5,),
                    const Text("Welcome to the app",style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FilledButton(
                      onPressed: controller.onTapLogin,
                      child: const Text(
                        "Login",
                      ),
                    ),
                    const SizedBox(height: 15,),
                    OutlinedButton(
                        onPressed: controller.onTapRegister,
                        child: const Text("Register",),),
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Designed & Developed by "),
                  Text(
                    "Ali Fouad",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
