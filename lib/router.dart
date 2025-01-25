import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/widgets/error.dart';
import 'package:whatsapp_clone/features/auth/screens/login_screen.dart';
import 'package:whatsapp_clone/features/auth/screens/otp_screen.dart';

Route<dynamic> generateRoute(RouteSettings setting) {
  switch (setting.name) {
    case LoginScreen.routName:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case OtpScreen.routName:
      final verificationId = setting.arguments as String;
      return MaterialPageRoute(
          builder: (context) => OtpScreen(
                verificationId: verificationId,
              ));
    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Errorr(error: 'This page doesn\'t exist'),
              ));
  }
}
