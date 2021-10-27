import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Column(children: [
          ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.REGISTER),
              child: const Text('Register'))
        ]));
  }
}
