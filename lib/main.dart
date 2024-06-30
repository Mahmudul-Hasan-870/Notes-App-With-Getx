import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gets/routes/route_names.dart';
import 'package:gets/routes/route_pages.dart';
import 'package:gets/utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter GetX',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: AppColors.backgroundColor,
          useMaterial3: true),
      getPages: RoutePages.route,
      initialRoute: RouteNames.home,
    );
  }
}
