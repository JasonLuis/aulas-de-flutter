import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:login_facebook/screens/login.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Alguma Coisa",
              style: TextStyle(
                fontSize: 35.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://revistacarro.com.br/wp-content/uploads/2019/10/Honda-Civic_2.jpg"),
              radius: 60.0,
            ),
            SizedBox(
              height: 100.0,
            ),
            SignInButton(
              Buttons.Facebook,
              text: "Sign out Facebook",
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Login()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
