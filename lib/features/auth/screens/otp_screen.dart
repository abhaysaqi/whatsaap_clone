import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/common/utils/colors.dart';
import 'package:whatsapp_clone/features/auth/controller/auth_controller.dart';

class OtpScreen extends ConsumerWidget {
  static const String routName = "/otp_screen";
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  void verifyOtp(WidgetRef ref, BuildContext context, String userOtp) {
    ref
        .read(authControllerProvider)
        .verifyOtp(context, verificationId, userOtp);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Verifying your number"),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text("We have sent an SMS with code"),
            SizedBox(
              width: size.width * 0.5,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: "------", hintStyle: TextStyle(fontSize: 30.sp)),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.length == 6) {
                    print("Verifying Otp");
                    verifyOtp(ref, context, value.trim());
                  }
                  print("function running");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
