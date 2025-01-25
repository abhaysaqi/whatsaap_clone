import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/common/utils/colors.dart';
import 'package:whatsapp_clone/common/utils/utils.dart';
import 'package:whatsapp_clone/common/widgets/custom_button.dart';
import 'package:whatsapp_clone/features/auth/controller/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routName = "/login_screen";
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;

  void pickCountry() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        setState(() {
          country = country;
        });
        print('Select country: ${country.displayName}');
      },
    );
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneController.text.trim();
    if (country != null && phoneNumber.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .signWithPhone(context, '+${country!.phoneCode}$phoneNumber');
    } else {
      showSnackBar(context: context, content: "Fill out all the fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter your phone number"),
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Whatsapp will need to verify your phone number.',
                  style: TextStyle(color: textColor, fontSize: 14.sp),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextButton(
                    onPressed: () {
                      pickCountry();
                    },
                    child: Text(
                      "Pick Country",
                      style: TextStyle(color: Colors.blue),
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    if (country != null)
                      Text(
                        '+${country!.phoneCode}',
                        style: TextStyle(color: textColor),
                      ),
                    SizedBox(
                      width: 5.w,
                    ),
                    TextField(
                        maxLength: 10,
                        controller: phoneController,
                        decoration: InputDecoration(hintText: "phone number"))
                  ],
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 90.w,
                  child: CustomButton(
                      text: "NEXT",
                      onpressed: () {
                        sendPhoneNumber();
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
