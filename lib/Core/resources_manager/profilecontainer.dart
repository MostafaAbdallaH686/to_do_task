import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/Core/resources_manager/app_colors.dart';
import 'package:to_do_app/Core/resources_manager/app_icons.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
    required this.icon1p,
    required this.textp,
    required this.nextscreen,
  });
  final String icon1p;
  final String textp;
  final Widget nextscreen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextscreen), // الصفحة الجديدة
        );
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        width: double.infinity,
        height: 63,
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon1p),
            Text(
              textp,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            SvgPicture.asset(Myicons.arrow),
          ],
        ),
      ),
    );
  }
}
