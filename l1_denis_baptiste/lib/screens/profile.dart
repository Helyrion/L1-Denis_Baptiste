import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:l1_denis_baptiste/routes/routes.dart';

import '../controllers/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  final 

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: Column(children: [
          const Text('mail'),
          ElevatedButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              child: const Text('Déconnexion'))
        ])));
  }
}
