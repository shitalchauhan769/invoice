import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoice_app/utils/app_routse.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xff0675ff), systemNavigationBarColor: Color(0xff0675ff)));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: app_routs,
  ));
}
