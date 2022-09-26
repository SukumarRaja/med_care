import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/ui/screens/initial/initial.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: InitialLoginTest(),
    ),
  );
}
