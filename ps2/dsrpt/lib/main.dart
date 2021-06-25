import 'package:flutter/material.dart';
import 'constantes.dart';
import 'create_update/create.dart';
import 'home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSRPT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: cPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: cTextoCor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/cadastrar': (context) => CreateBot(),
      },
    );
  }
}
