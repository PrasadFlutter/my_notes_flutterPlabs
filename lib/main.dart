import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad_demo_app_gsheet_project/Gsheet_Service/GsheetSetup.dart';
import 'package:notepad_demo_app_gsheet_project/Screens/HomeScreen.dart';
import 'package:sizer/sizer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GsheetIntit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder:
        (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return GetMaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
