import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notepad_demo_app_gsheet_project/CommonService/CommonAlert.dart';
import 'package:notepad_demo_app_gsheet_project/CommonService/CommonLoader.dart';
import 'package:notepad_demo_app_gsheet_project/Gsheet_Service/GsheetCrud.dart';
import 'package:notepad_demo_app_gsheet_project/Gsheet_Service/IdGenerator.dart';
import 'package:notepad_demo_app_gsheet_project/Screens/HomeScreen.dart';
import 'package:sizer/sizer.dart';

class DetailsScreen extends StatefulWidget {
  final from;
  final NotesArray;

  const DetailsScreen({super.key, required this.from, this.NotesArray});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  TextEditingController heading = TextEditingController();
  TextEditingController details = TextEditingController();
  List ColorsArray = [
    '0xff2196f3'
        '0xff4caf50',
    '0xffe91e63',
    '0xff9c27b0',
    '0xffff9800',
    '0xfffbc02d',
    '0xff000000',
    '0xff795548'
  ];
  int ColorIndex = 0;

  @override
  void initState() {
    AutoFillData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse(ColorsArray[ColorIndex])),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(1.5.h),
        width: 100.w,
        child: SingleChildScrollView(
          child: Column(
            children: [AppBarDetailScreen(), Heading(), Details()],
          ),
        ),
      )),
    );
  }

  AppBarDetailScreen() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackButton(
          color: Colors.white,
          onPressed: () {
            Get.offAll(HomeScreen());
          },
        ),
        SizedBox(
          width: 50.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () async {
                  if (widget.from == 'fab') {
                    CreateNewNotes();
                  } else {
                    UpdateNotes();
                  }
                },
                child: Icon(
                  Icons.save_rounded,
                  color: Colors.white,
                  size: 4.h,
                ),
              ),
              InkWell(
                onTap: () {
                  if (ColorIndex == ColorsArray.length - 1) {
                    ColorIndex = 0;
                  } else {
                    ColorIndex++;
                  }
                  setState(() {});
                },
                child: Icon(
                  Icons.color_lens,
                  color: Colors.white,
                  size: 4.h,
                ),
              ),
              InkWell(
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: details.text));
                  CommonAlert(
                      context: context, message: 'Notes Copied Successfully');
                },
                child: Icon(
                  Icons.copy_all_sharp,
                  color: Colors.white,
                  size: 4.h,
                ),
              ),
              InkWell(
                onTap: () async {
                  await deleteDataFromSheet(
                      IDFromNotes: widget.NotesArray['id']);
                  CommonAlert(
                      context: context, message: 'Notes Deleted Successfully');
                  Get.offAll(HomeScreen());
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 4.h,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Heading() {
    return SizedBox(
      width: 100.w,
      child: TextFormField(
        controller: heading,
        enableSuggestions: true,
        keyboardType: TextInputType.text,
        cursorColor: Colors.white,
        maxLines: 2,
        maxLength: 50,
        style: GoogleFonts.oxygen(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        decoration: InputDecoration(
            hintText: 'Type Notes Heading Here',
            hintStyle: GoogleFonts.oxygen(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            contentPadding: EdgeInsets.all(2.h),
            counterText: '',
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.5),
                borderRadius: BorderRadius.circular(6)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.5),
                borderRadius: BorderRadius.circular(6)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.5),
                borderRadius: BorderRadius.circular(6)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.5),
                borderRadius: BorderRadius.circular(6)),
            fillColor: Colors.transparent,
            filled: true),
      ),
    );
  }

  Details() {
    return SizedBox(
      width: 100.w,
      child: TextFormField(
        controller: details,
        enableSuggestions: true,
        keyboardType: TextInputType.text,
        cursorColor: Colors.white,
        maxLength: 2000,
        maxLines: 50,
        style: GoogleFonts.oxygen(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
        decoration: InputDecoration(
            hintText: 'Type Notes Details Here...',
            hintStyle: GoogleFonts.oxygen(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            contentPadding: EdgeInsets.all(2.h),
            counterText: '',
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.5),
                borderRadius: BorderRadius.circular(6)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.5),
                borderRadius: BorderRadius.circular(6)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.5),
                borderRadius: BorderRadius.circular(6)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.5),
                borderRadius: BorderRadius.circular(6)),
            fillColor: Colors.transparent,
            filled: true),
      ),
    );
  }

  CreateNewNotes() async {
    AlertLoader(color: Colors.white, context: context);
    await UniqueIdGenerator();
    await insertDataIntoSheet(
        ID: ID,
        heading: '${heading.text}',
        color: '${ColorsArray[ColorIndex]}',
        details: '${details.text}',
        time:
            '${DateTime.now().day} - ${DateTime.now().month} - ${DateTime.now().year}');
    Get.back();
    CommonAlert(context: context, message: 'Notes Saved Successfully');
  }

  UpdateNotes() async {
    AlertLoader(color: Colors.white, context: context);
    await updateDataFromSheet(
        IDFromNotes: ID,
        heading: '${heading.text}',
        color: '${ColorsArray[ColorIndex]}',
        details: '${details.text}',
        time:
            '${DateTime.now().day} - ${DateTime.now().month} - ${DateTime.now().year}');
    Get.back();
    CommonAlert(context: context, message: 'Notes Updated Successfully');
  }

  AutoFillData() async {
    if (widget.from == 'fab') {
      ColorsArray[ColorIndex] = '0xff2196f3';
    } else {
      print(widget.NotesArray);
      heading.text = await widget.NotesArray['heading'];
      ColorsArray[ColorIndex] = await widget.NotesArray['color'];
      details.text = await widget.NotesArray['details'];
      setState(() {});
    }
  }
}
