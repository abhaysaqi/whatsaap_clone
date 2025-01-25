import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/utils/colors.dart';

class Errorr extends StatelessWidget {
  final String error;
  const Errorr({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(error,style: TextStyle(color: textColor, fontWeight: FontWeight.bold),),);
  }
}
