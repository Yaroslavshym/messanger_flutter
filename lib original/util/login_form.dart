import 'package:flutter/material.dart';
import 'package:messanger_flutter/auth/federated_signin/google_signin.dart';
import 'package:messanger_flutter/util/text_form_field.dart';
import 'package:provider/provider.dart';

import '../theme/current_theme_provider.dart';
import 'button.dart';

class LoginForm extends StatefulWidget {
  final String mainButtonText;
  final String secondaryMainButtonText;
  final VoidCallback mainButtonPressed;
  final VoidCallback secondaryMainButtonPressed;
  final VoidCallback whenLoggedin;
  final bool isLogin;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  // final providerName; // any provider that you want to use
  const LoginForm({
    required this.whenLoggedin,
    required this.mainButtonText,
    required this.isLogin,
    required this.secondaryMainButtonText,
    required this.mainButtonPressed,
    required this.secondaryMainButtonPressed,
    required this.emailController,
    required this.passwordController,
    // required this.providerName
    // , this.provider = Provider.of<IntroPageProvider>(context);,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    CurrentThemeProvider themeProvider =
        Provider.of<CurrentThemeProvider>(context);
    Color primaryColor = themeProvider.primaryColor;
    Color secondaryColor = themeProvider.secondaryColor;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Hello, Let\'s ${widget.isLogin ? 'log in' : 'sing up'}!',
            style: TextStyle(color: secondaryColor),
          ),
          // email text field
          MyTextFormField(
            controller: widget.emailController,
            labelText: 'Email',
          ),
          const SizedBox(height: 10),
          // password text field
          MyTextFormField(
            controller: widget.passwordController,
            labelText: 'Password',
          ),
          const SizedBox(height: 10),

          // sing in button
          MyButton(
            buttonText: widget.mainButtonText,
            buttonPressed: widget.mainButtonPressed,
            // changeHeightBy: -30,
            changeWidthBy: -20,
          ),
          const SizedBox(height: 10),

          // button to sign up page

          MyButton(
            changeHeightBy: -30,
            changeWidthBy: -60,
            buttonText: widget.secondaryMainButtonText,
            buttonPressed: () {
              widget.secondaryMainButtonPressed();
            },
          ),
          const SizedBox(height: 10),
          // google sign in buttons
          widget.isLogin
              ? MyButton(
                  changeHeightBy: -30,
                  changeWidthBy: -60,
                  buttonText: 'Google!',
                  buttonPressed: () async {
                    await GoogleAuth().signInWithGoogle();
                  })
              : const SizedBox(),
        ],
      ),
    );
  }
}
