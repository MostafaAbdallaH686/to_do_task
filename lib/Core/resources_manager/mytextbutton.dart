import 'package:flutter/material.dart';
import 'package:to_do_app/Core/resources_manager/app_colors.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key,
    this.height = 48.01,
    required this.offsety,
    required this.shadowcolor,
    required this.buttontext,
    required this.newscreen,
    required this.onpressed,
  });
  final double? height;
  final double offsety;
  final Color shadowcolor;
  final String buttontext;
  final Widget? newscreen;
  final void Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 331,
      height: height,
      margin: EdgeInsets.only(left: 22, right: 22, top: 30),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: shadowcolor.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 0,
            offset: Offset(0, offsety),
          ),
        ],
        borderRadius: BorderRadius.circular(14),
        color: MyColors.green,
      ),
      child: TextButton(
        onPressed: onpressed,

        child: Text(
          buttontext,
          style: TextStyle(
            color: MyColors.white,
            fontSize: 19,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
