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
      favorite: ["IN"],
      context: context,
      showPhoneCode: true,
      onSelect: (Country contry) {
        setState(() {
          country = contry;
        });
        print('Select country: ${country!.displayName}');
      },
    );
  }

  void sendPhoneNumber() {
    String phone = phoneController.text.trim();
    if (country != null && phone.isNotEmpty) {
      final phoneNumber =
          '+${country!.phoneCode} ${phone.substring(0, 4)} ${phone.substring(4, 7)} ${phone.substring(7)}'; //

      ref.read(authControllerProvider).signWithPhone(context, phoneNumber);
    } else {
      showSnackBar(context: context, content: "Fill out all the fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios_new_rounded),
          leadingWidth: 30.w,
          title: Text(
            "Enter your phone number",
            style: TextStyle(fontSize: 24.sp),
          ),
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Whatsapp will need to verify your phone number.',
                  style: TextStyle(color: textColor, fontSize: 14.sp),
                ),
                SizedBox(height: 10.h),
                TextButton(
                  onPressed: pickCountry,
                  child: Text(
                    "Pick Country",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: country == null
                      ? EdgeInsets.symmetric(horizontal: 10.w)
                      : EdgeInsets.only(left: 10.w, right: 40.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (country != null)
                        Text(
                          '+${country!.phoneCode}',
                          style: TextStyle(color: textColor, fontSize: 16.sp),
                        ),
                      SizedBox(width: 5.w),
                      Expanded(
                        // Ensure TextField does not overflow
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          controller: phoneController,
                          decoration: InputDecoration(
                              hintText: "Phone number", counterText: ""),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              width: 120.w,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: CustomButton(
                text: "NEXT",
                color: tabColor,
                onpressed: sendPhoneNumber,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
