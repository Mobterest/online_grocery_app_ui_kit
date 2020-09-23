import 'package:flutter/material.dart';
import './globals/config.dart';
import './pages/signin.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: FONT_FAMILY),
      home: Scaffold(
        
      body: WillPopScope(
        onWillPop: () async => Future.value(false),
        child: Signin()
        )),
      debugShowCheckedModeBanner: false,
    );
  }
}