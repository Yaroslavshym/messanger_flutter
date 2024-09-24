import 'package:flutter/material.dart';
import 'package:messanger_flutter/auth/email_signin/email_signin.dart';
import 'package:messanger_flutter/pages/intro_page/intro_page_provider.dart';
import 'package:provider/provider.dart';

import '../../util/login_form.dart';

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
                  final bool isSuccessful = await EmailAuth().signIn(
                    emailAddress: provider.emailController.text,
                    password: provider.passwordController.text,
                    context: context,
                  );
                  if (isSuccessful) {
                    Navigator.pushReplacementNamed(context, '/MainPage');
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
                  final bool isSuccessful = await EmailAuth().signUp(
                    emailAddress: provider.emailController.text,
                    password: provider.passwordController.text,
                    context: context,
                  );
                  if (isSuccessful) {
                    Navigator.pushReplacementNamed(context, '/MainPage');
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
