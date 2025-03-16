import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyInProgressContainer extends StatelessWidget {
  const MyInProgressContainer({
    super.key,
    required this.color,
    required this.label,
    required this.describtion,
    required this.icon,
    required this.textcolor,
    required this.labelcolor,
  });
  final Color color;
  final String label;
  final String describtion;
  final String icon;
  final Color textcolor;
  final Color labelcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 234,
      height: 125,
      margin: EdgeInsets.only(left: 20, top: 15, bottom: 15),
      padding: EdgeInsets.only(right: 10, left: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: labelcolor,
                ),
              ),
              Spacer(),
              SvgPicture.asset(icon),
            ],
          ),
          Text(
            describtion,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: textcolor,
            ),
          ),
        ],
      ),
    );
  }
}
