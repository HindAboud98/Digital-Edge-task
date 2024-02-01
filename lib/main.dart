import 'package:digital_edge_task/bindings/home_screen_bindings.dart';
import 'package:digital_edge_task/bindings/initial_bindings.dart';
import 'package:digital_edge_task/bindings/login_screen_bindings.dart';
import 'package:digital_edge_task/bindings/register_screen_bindings.dart';
import 'package:digital_edge_task/bindings/splash_screen_bindings.dart';
import 'package:digital_edge_task/bindings/update_iformation_bindings.dart';
import 'package:digital_edge_task/ui/theme.dart';
import 'package:digital_edge_task/view/home_screen.dart';
import 'package:digital_edge_task/view/login_screen.dart';
import 'package:digital_edge_task/view/register_screen.dart';
import 'package:digital_edge_task/view/splash_screen.dart';
import 'package:digital_edge_task/view/update_information_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: theme,
      initialBinding: InitialBindings(),
      getPages: [
        GetPage(
          name: "/",
          page: () => const SplashScreen(),
          binding: SplashScreenBindings(),
        ),
        GetPage(
          name: "/login",
          page: () => const LoginScreen(),
          binding: LoginScreenBindings(),
        ),
        GetPage(
          name: "/register",
          page: () => const RegisterScreen(),
          binding: RegisterScreenBindings(),
        ),
        GetPage(
          name: "/home",
          page: () => const HomeScreen(),
          binding: HomeScreenBindings(),
        ),
        GetPage(
          name: "/update-info",
          page: () => const UpdateInformationScreen(),
          binding: UpdateInformationBindings(),
        ),
      ],
    );
  }
}
