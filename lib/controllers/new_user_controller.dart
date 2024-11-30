import 'package:flutter/material.dart';

class NewUserController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    confirmPasswordController.dispose();
  }
}