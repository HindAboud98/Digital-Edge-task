import 'package:digital_edge_task/controllers/login_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/ali_fouad_logo.png",
                    height: Get.height / 5,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
              Expanded(
                  flex: 2,
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: controller.emailCtrl,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: "Email Address",
                          ),
                          validator: (val){
                            return val == null ? "This field is required" : null ;
                          },
                        ),
                        const SizedBox(height: 15 ,),
                        Obx(() => TextFormField(
                          controller: controller.passwordCtrl,  //TODO hide password
                          textAlign: TextAlign.center,
                          obscureText: controller.showPassword,
                          decoration: InputDecoration(
                              hintText: "Password",
                              suffixIcon: IconButton(onPressed: controller.toggleShowPassword, icon: Icon( controller.showPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ,) )
                          ),
                          validator: (val){
                            return val == null ? "This field is required" : null ;
                          },
                        ),),
                        const SizedBox(height: 30 ,),
                        Obx(() => controller.isLoading ? const Center(child: CircularProgressIndicator(),) :FilledButton(
                          onPressed: controller.login,
                          child: const Text(
                            "Login",
                          ),
                        ),),
                      ],
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  TextButton(onPressed: controller.onRegisterTapped, child: const Text("Register"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
