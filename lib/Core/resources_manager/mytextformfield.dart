import 'package:flutter/material.dart';
import 'package:to_do_app/Core/resources_manager/app_colors.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.maxlines,
    required this.hinttext,
    required this.labeltext,
    this.height = 63,
    this.controller,
    this.top = 0,
    this.validator,
  });
  final int maxlines;
  final String hinttext;
  final String labeltext;
  final double? height;
  final TextEditingController? controller;
  final double? top;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16),
      width: 331,
      height: height,
      margin: EdgeInsets.only(left: 22, top: top!, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        color: MyColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        validator: validator,
        controller: controller,
        maxLines: maxlines,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labeltext,
          labelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: MyColors.gray,
          ),
          hintText: hinttext,
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: MyColors.gray,
          ),
        ),
      ),
    );
  }
}
