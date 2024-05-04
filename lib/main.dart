import 'package:campuslink_mobile/res/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'res/getx_loclization/languages.dart';
import 'res/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CampusLink',
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.secondaryColor),
        useMaterial3: true,
        textTheme: GoogleFonts.workSansTextTheme(),
      ),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
