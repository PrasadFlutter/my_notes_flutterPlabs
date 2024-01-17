import 'package:get/get.dart';
import 'package:notepad_demo_app_gsheet_project/CommonService/CommonText.dart';
import 'package:notepad_demo_app_gsheet_project/Screens/DetailsScreen.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

var CommonFab = Padding(
  padding: EdgeInsets.only(bottom: 4.1.h, right: 2.h),
  child: FloatingActionButton.extended(
    backgroundColor: Colors.blue,
    icon: Icon(Icons.add_circle),
    label: CommonText(
      label: 'Create New',
      colorT: Colors.white,
      fontw8: FontWeight.w600,
      size: 11.sp,
    ),
    onPressed: () {
      Get.to(DetailsScreen(
        from: 'fab',
        NotesArray: null,
      ));
    },
  ),
);

var CenterLoc = FloatingActionButtonLocation.centerFloat;
