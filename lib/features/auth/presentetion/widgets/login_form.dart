import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/theme/current_theme_provider.dart';
import '../../domain/usecases/google_auth_use_case.dart';
import 'button.dart';
import 'text_form_field.dart';

class LoginForm extends StatefulWidget {
  final String mainButtonText;
  final String secondaryMainButtonText;
  final VoidCallback mainButtonPressed;
  final VoidCallback secondaryMainButtonPressed;
  final VoidCallback whenLoggedin;
  final bool isLogin;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  TextEditingController? nameController;
  LoginForm({
    required this.whenLoggedin,
    required this.mainButtonText,
    required this.isLogin,
    required this.secondaryMainButtonText,
    required this.mainButtonPressed,
    required this.secondaryMainButtonPressed,
    required this.emailController,
    required this.passwordController,
    this.nameController,
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
    late TextEditingController nameController;
    if (widget.nameController is! TextEditingController) {
      nameController = TextEditingController();
    }
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Hello, Let\'s ${widget.isLogin ? 'log in' : 'sing up'}!',
            style: TextStyle(color: secondaryColor, fontSize: 18),
          ),
          !widget.isLogin
              ? MyTextFormField(
                  controller: nameController,
                  labelText: 'Name',
                )
              : const SizedBox(),
          SizedBox(height: !widget.isLogin ? 10 : 0),
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
                    await GoogleAuthUseCase().signInWithGoogle();
                  })
              : const SizedBox(),
        ],
      ),
    );
  }
}
