import 'package:flutter/material.dart';
import 'package:messanger_flutter/util/login_form.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LoginForm(
        buttonPressed: () {},
        mainButtonText: 'Log in ',
        secondaryMainButtonText: 'First time?\nSign up!',
        isLogin: true,
      ),
    );
  }
}
