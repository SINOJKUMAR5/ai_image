import 'package:ai_image/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyMaterialApp());
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: home_page(),
    );
  }
}
