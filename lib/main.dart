import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      theme: ThemeData(
        fontFamily: "Proxima",
      ),
      getPages: AppPages.routes,
    ),
  );
}
//   Grey: #909090
// Dark Purple: #7B4397
// DRO Purple: #9F5DE2
// DRO Turquoise: #0CB8B6
