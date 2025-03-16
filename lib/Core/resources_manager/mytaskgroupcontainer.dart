import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/Core/resources_manager/app_colors.dart' show MyColors;

class MyTaskGroupContainer extends StatelessWidget {
  const MyTaskGroupContainer({
    super.key,
    required this.icon1,
    required this.text,
    required this.containercolor,
    required this.textincontainercolor,
    required this.textincontainer,
  });
  final String icon1;
  final String text;
  final Color containercolor;
  final Color textincontainercolor;
  final String textincontainer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 63,
      margin: EdgeInsets.only(top: 10, right: 20, left: 20),
      padding: EdgeInsets.only(left: 10, top: 10, bottom: 15, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: MyColors.white,
      ),
      child: Row(
        children: [
          SvgPicture.asset(icon1),
          Text(
            text,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: containercolor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                textincontainer,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textincontainercolor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
