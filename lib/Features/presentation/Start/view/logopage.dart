import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:to_do_app/Core/resources_manager/app_icons.dart';

import 'package:to_do_app/Features/presentation/Start/view/startpage.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 60),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StartPage()),
                  );
                },
                child: Container(
                  width: 334,
                  height: 433,
                  margin: EdgeInsets.only(left: 20),
                  child: SvgPicture.asset(Myicons.splash),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
