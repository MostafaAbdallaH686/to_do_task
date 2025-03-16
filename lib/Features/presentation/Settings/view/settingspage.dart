import 'package:flutter/material.dart';

import 'package:to_do_app/Core/resources_manager/app_colors.dart';

import 'package:to_do_app/Core/resources_manager/app_setings.dart';

class Settingspage extends StatelessWidget {
  const Settingspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        centerTitle: true,
        title: Text(MyAppStrings.settingtitle),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                MyAppStrings.settinglang,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Spacer(),
              Container(
                width: 51,
                height: 36,
                decoration: BoxDecoration(
                  color: MyColors.newgray,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                ),
                child: Center(child: Text(MyAppStrings.ar)),
              ),
              Container(
                width: 51,
                height: 36,
                margin: EdgeInsets.only(right: 22),
                decoration: BoxDecoration(
                  color: MyColors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                ),
                child: Center(
                  child: Text(
                    MyAppStrings.en,
                    style: TextStyle(color: MyColors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
