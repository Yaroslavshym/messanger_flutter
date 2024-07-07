import 'package:flutter/material.dart';
import 'package:messanger_flutter/internal_storage/hive.dart';
import 'package:messanger_flutter/util/text_form_field.dart';
import 'package:provider/provider.dart';

import '../auth/federated_signin/google_signin.dart';
import '../providers/current_theme_provider.dart';
import 'button.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback buttonPressed;
  final String mainButtonText;
  final String secondaryMainButtonText;
  final bool isLogin;

  const LoginForm({
    required this.buttonPressed,
    required this.mainButtonText,
    required this.isLogin,
    required this.secondaryMainButtonText,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    CurrentThemeProvider currentThemeProvider =
        Provider.of<CurrentThemeProvider>(context);
    Color primaryColor = currentThemeProvider.primaryColor;
    Color secondaryColor = currentThemeProvider.secondaryColor;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Hello, Let\'s login',
            style: TextStyle(color: secondaryColor),
          ),
          // email text field
          MyTextFormField(
            controller: emailController,
            labelText: 'Email',
          ),
          SizedBox(height: 10),
          // password text field
          MyTextFormField(
            controller: passwordController,
            labelText: 'Password',
          ),
          SizedBox(height: 10),

          // sing in button
          // TODO: button Pressed
          MyButton(
            buttonText: widget.mainButtonText,
            buttonPressed: () {},
            // changeHeightBy: -30,
            changeWidthBy: -20,
          ),
          SizedBox(height: 10),

          // button to sign up
          // TODO: button Pressed

          MyButton(
            changeHeightBy: -30,
            changeWidthBy: -60,
            buttonText: widget.secondaryMainButtonText,
            buttonPressed: () {},
          ),
          SizedBox(height: 10),
          // google sign in buttons
          MyButton(
            changeHeightBy: -30,
            changeWidthBy: -60,
            buttonText: 'Google!',
            buttonPressed: () {
              setState(() {
                signInWithGoogle().then((value) {
                  MyHive().addData('userCredential', value);
                }).whenComplete(() {
                  Navigator.pushReplacementNamed(context, '/MainPage');
                });
              });
            },
          ),
          // facebook button

          // MyButton(
          //   changeHeightBy: -30,
          //   changeWidthBy: -60,
          //   buttonText: 'Facebook!!',
          //   buttonPressed: () async {
          //     setState(() {
          //       userCredential = '${signInWithFacebook()}';
          //     });
          //   },
          // ),

          //github button
          // MyButton(
          //   changeHeightBy: -30,
          //   changeWidthBy: -60,
          //   buttonText: 'Github!',
          //   buttonPressed: () async {
          //     setState(() {
          //       userCredential = '${signInWithGitHub()}';
          //     });
          //   },
          // ),
        ],
      ),
    );
  }
}
