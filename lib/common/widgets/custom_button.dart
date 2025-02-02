// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:whatsapp_clone/common/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  Color? color;
  EdgeInsets? padding;

  CustomButton({
    super.key,
    required this.text,
    required this.onpressed,
    this.color,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: color,
          // minimumSize: Size(double.infinity.w, 50.h),
          padding: padding),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, color: blackColor),
      ),
    );
  }
}
