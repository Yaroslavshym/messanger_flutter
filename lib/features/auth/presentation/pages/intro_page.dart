import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/usecases/email_auth_use_case.dart';
import '../provider/intro_page_provider.dart';
import '../widgets/alert_dialog.dart';
import '../widgets/login_form.dart';

class IntroPage extends StatefulWidget {
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  void whenLoggedin() {
    Navigator.pushReplacementNamed(context, '/MainPage');
  }

  @override
  Widget build(BuildContext context) {
    IntroPageProvider provider = Provider.of<IntroPageProvider>(context);
    IntroPageProvider providerNotListen =
        Provider.of<IntroPageProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.black,
        body: provider.isLoginState
            // Sign in
            ? LoginForm(
                passwordController: providerNotListen.passwordController,
                emailController: providerNotListen.emailController,
                mainButtonPressed: () async {
                  try {
                    final bool isSuccessful = await EmailAuthUseCase().signIn(
                      emailAddress: provider.emailController.text,
                      password: provider.passwordController.text,
                    );
                    if (isSuccessful) {
                      Navigator.pushReplacementNamed(context, '/MainPage');
                    }
                  } catch (e) {
                    MyAlertDialog(
                      text: e.toString(),
                      buttonText: 'OK',
                    ).show(context);
                  }
                },
                secondaryMainButtonPressed: provider.changeState,
                mainButtonText: 'Log in',
                secondaryMainButtonText: 'First time?\nSign up!',
                isLogin: provider.isLoginState,
                whenLoggedin: whenLoggedin,
              )
            // Sing up
            : LoginForm(
                emailController: provider.emailController,
                passwordController: provider.passwordController,
                mainButtonPressed: () async {
                  try {
                    final bool isSuccessful = await EmailAuthUseCase().signUp(
                      name: provider.nameController.text,
                      emailAddress: provider.emailController.text,
                      password: provider.passwordController.text,
                    );
                    if (isSuccessful) {
                      Navigator.pushReplacementNamed(context, '/MainPage');
                    }
                  } catch (e) {
                    MyAlertDialog(
                      text: e.toString(),
                      buttonText: 'OK',
                    ).show(context);
                  }
                },
                secondaryMainButtonPressed: provider.changeState,
                mainButtonText: 'Sign up',
                secondaryMainButtonText: 'Not first time?\nLog in!',
                isLogin: provider.isLoginState,
                whenLoggedin: whenLoggedin,
              ));
  }
}
