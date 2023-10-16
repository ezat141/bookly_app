import 'package:bookly_app/Features/Splash/presentation/views/splash_view.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(scaffoldBackgroundColor: kPrimaryColor),
      home:  const SplashView(),
    );
  }
}

