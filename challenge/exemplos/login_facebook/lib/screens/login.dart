import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:login_facebook/screens/home.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SignInButton(
              Buttons.Facebook,
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Home()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
