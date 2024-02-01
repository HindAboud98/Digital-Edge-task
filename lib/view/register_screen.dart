import 'package:country_code_picker/country_code_picker.dart';
import 'package:digital_edge_task/controllers/register_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetView<RegisterScreenController> {
  const RegisterScreen({super.key});

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
                children: [
                  Image.asset(
                    "assets/images/ali_fouad_logo.png",
                    height: Get.height / 5,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Register",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
              Expanded(
                  flex: 2,
                  child: Form(
                    key: controller.formKey,
                    child: ListView(
                      children: [
                        TextFormField(
                          controller: controller.nameCtrl,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: "Full Name",
                          ),
                          validator: (val) {
                            return val == null
                                ? "This field is required"
                                : null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: controller.phoneCtrl,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 70),
                            prefixIcon: CountryCodePicker(
                              initialSelection: controller.countryCode,
                              padding: EdgeInsets.zero,
                              hideMainText: true,
                              onChanged: controller.onCountryChanged,
                            ),
                            hintText: "55994435",
                          ),
                          validator: (val) {
                            return val == null
                                ? "This field is required"
                                : null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: controller.emailCtrl,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: "Email Address",
                          ),
                          validator: (val) {
                            return val == null
                                ? "This field is required"
                                : null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(
                          () => TextFormField(
                            controller: controller.passwordCtrl,
                            textAlign: TextAlign.center,
                            obscureText: controller.showPassword,
                            decoration: InputDecoration(
                                hintText: "Password",
                                suffixIcon: IconButton(
                                    onPressed: controller.toggleShowPassword,
                                    icon: Icon(
                                      controller.showPassword
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                    ))),
                            validator: (val) {
                              return val == null
                                  ? "This field is required"
                                  : null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(
                          () => TextFormField(
                            controller: controller.confirmPasswordCtrl,
                            textAlign: TextAlign.center,
                            obscureText: controller.showConfirmPassword,
                            decoration: InputDecoration(
                                hintText: "Password",
                                suffixIcon: IconButton(
                                    onPressed:
                                        controller.toggleShowConfirmPassword,
                                    icon: Icon(
                                      controller.showConfirmPassword
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                    ))),
                            validator: (val) {
                              return val == null
                                  ? "This field is required"
                                  : null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Obx(
                          () => controller.isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : FilledButton(
                                  onPressed: controller.register,
                                  child: const Text(
                                    "Register",
                                  ),
                                ),
                        ),
                      ],
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                      onPressed: controller.onLoginTapped,
                      child: const Text("Login"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
