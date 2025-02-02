import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/common/utils/colors.dart';
import 'package:whatsapp_clone/common/widgets/custom_button.dart';
import 'package:whatsapp_clone/features/auth/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Text(
              "Welcome to WhatsApp",
              style: TextStyle(
                  color: textColor,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: (size.height / 9).h,
            ),
            Expanded(
              child: Image.asset(
                "assets/img/bg.png",
                color: tabColor,
              ),
            ),
            SizedBox(
              height: (size.height / 9).h,
            ),
            const Text(
              'Read our Privacy Policy. Tap "Agree and continue" to accept the Termns of Service.',
              style: TextStyle(color: greyColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: size.width * 0.8,
              child: CustomButton(
                color: tabColor,
                text: "AGREE AND CONTINUE",
                onpressed: () => navigateToLoginScreen(context),
              ),
            )
          ],
        ),
      )),
    );
  }
}
