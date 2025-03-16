import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/Core/resources_manager/app_colors.dart';
import 'package:to_do_app/Core/resources_manager/app_icons.dart';
import 'package:to_do_app/Core/resources_manager/customappbar.dart';
import 'package:to_do_app/Core/resources_manager/myinprogresscontainer.dart';
import 'package:to_do_app/Core/resources_manager/mytaskgroupcontainer.dart';
import 'package:to_do_app/Features/presentation/Add%20task/view/addtaskpage.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTaskPage(),
                ), // الصفحة الجديدة
              );
            },
            icon: SvgPicture.asset(Myicons.addtask),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 135,
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.only(left: 22, top: 15, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: MyColors.green,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your today's tasks",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: MyColors.white,
                  ),
                ),
                Text(
                  "almost done!",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: MyColors.white,
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "80",
                      style: TextStyle(
                        color: MyColors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "%",
                      style: TextStyle(
                        color: MyColors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 121,
                      height: 36,
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                        child: Text(
                          "View Tasks",
                          style: TextStyle(
                            color: MyColors.green,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                "  In Progress    ",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: MyColors.mintgreen,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "5",
                    style: TextStyle(
                      color: MyColors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 125,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MyInProgressContainer(
                    color: MyColors.black,
                    label: "Work Task",
                    describtion: "Add New Features",
                    icon: Myicons.workbag,
                    textcolor: MyColors.white,
                    labelcolor: MyColors.white,
                  ),
                  MyInProgressContainer(
                    color: MyColors.mintgreen,
                    label: "Personal Task",
                    describtion:
                        "Improve My English Skills \nby trying to speek ",
                    icon: Myicons.person,
                    textcolor: MyColors.black,
                    labelcolor: MyColors.gray,
                  ),
                  MyInProgressContainer(
                    color: MyColors.homecolor,
                    label: "Home Task",
                    describtion:
                        "Add new feature for Do It \napp and commit it",
                    icon: Myicons.home,
                    textcolor: MyColors.black,
                    labelcolor: MyColors.gray,
                  ),
                ],
              ),
            ),
          ),
          Text(
            "  Task Groups",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          MyTaskGroupContainer(
            icon1: Myicons.person,
            text: "   Personal Task",
            containercolor: MyColors.mintgreen,
            textincontainercolor: MyColors.green,
            textincontainer: '5',
          ),
          MyTaskGroupContainer(
            icon1: Myicons.home,
            text: "   Home Task",
            containercolor: MyColors.homecolor,
            textincontainercolor: MyColors.red,
            textincontainer: '3',
          ),
          MyTaskGroupContainer(
            icon1: Myicons.workbag,
            text: "   Work task",
            containercolor: MyColors.black,
            textincontainercolor: MyColors.white,
            textincontainer: '1',
          ),
        ],
      ),
    );
  }
}
