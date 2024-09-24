import 'package:flutter/material.dart';

class IntroPageProvider extends ChangeNotifier {
  bool isLoginState = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  void changeState() {
    isLoginState = !isLoginState;
    notifyListeners();
  }
}
