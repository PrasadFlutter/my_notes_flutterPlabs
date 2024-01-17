import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad_demo_app_gsheet_project/CommonService/CommonAlert.dart';
import 'package:notepad_demo_app_gsheet_project/CommonService/CommonLoader.dart';
import 'package:notepad_demo_app_gsheet_project/CommonService/CommonText.dart';
import 'package:notepad_demo_app_gsheet_project/CommonService/Fab.dart';
import 'package:notepad_demo_app_gsheet_project/Screens/DetailsScreen.dart';
import 'package:notepad_demo_app_gsheet_project/Gsheet_Service/GsheetCrud.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    FetchedData();
    super.initState();
  }

  FetchedData() async {
    await Future.delayed(Duration(seconds: 1), () {
      AlertLoader(color: Colors.black, context: context);
    });
    await readDataFromSheet();
    Get.back();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CommonFab,
      floatingActionButtonLocation: CenterLoc,
      body: SafeArea(
        child: Container(
          height: 100.h,
          width: 100.w,
          padding: EdgeInsets.all(2.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      label: 'My Notes',
                      colorT: Colors.black,
                      fontw8: FontWeight.w900,
                      size: 16.sp,
                    ),
                    InkWell(
                      onTap: () {
                        FetchedData();
                      },
                      child: Icon(
                        Icons.refresh,
                        color: Colors.black,
                        size: 4.h,
                      ),
                    ),
                  ],
                ),
                dataFromSheet.isEmpty
                    ? CreateNewNotes()
                    : Wrap(
                        children: [
                          for (var index = 0;
                              index < dataFromSheet.length;
                              index++)
                            GestureDetector(
                              onTap: () {
                                Get.to(DetailsScreen(
                                  from: 'notes',
                                  NotesArray: dataFromSheet[index],
                                ));
                              },
                              child: Container(
                                height: 32.h,
                                width: 43.w,
                                margin: EdgeInsets.only(top: 2.h, right: 2.w),
                                padding: EdgeInsets.all(2.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 1,
                                          color: Colors.black12,
                                          spreadRadius: 2,
                                          offset: Offset(0, 2))
                                    ],
                                    color: Color(int.parse(
                                        dataFromSheet[index]['color']))),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 6.2.h,
                                      child: CommonText(
                                        label:
                                            '${dataFromSheet[index]['heading']}',
                                        colorT: Colors.white,
                                        fontw8: FontWeight.w900,
                                        size: 16.sp,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 1.h),
                                        child: CommonText(
                                          label:
                                              '${dataFromSheet[index]['details']}',
                                          colorT: Colors.white,
                                          fontw8: FontWeight.w600,
                                          size: 11.sp,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 20.w,
                                          child: CommonText(
                                            label:
                                                'Last Updated at ${dataFromSheet[index]['time']}',
                                            colorT: Colors.white,
                                            fontw8: FontWeight.w600,
                                            size: 8.5.sp,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            AlertLoader(
                                                color: Colors.black,
                                                context: context);
                                            await deleteDataFromSheet(
                                                IDFromNotes:
                                                    dataFromSheet[index]['id']);
                                            await readDataFromSheet();
                                            Get.back();
                                            CommonAlert(
                                                context: context,
                                                message:
                                                    'Notes Deleted Successfully');
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                            size: 4.h,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CreateNewNotes() {
    return Center(
      heightFactor: 4.2.h,
      child: CommonText(
        label: 'No Notes Available',
        colorT: Colors.black,
        fontw8: FontWeight.w600,
        size: 11.sp,
      ),
    );
  }
}
