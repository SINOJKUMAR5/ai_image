import 'package:ai_image/text_to_image.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 500,
          ),
          TextField(
            controller: controller,
          ),
          TextButton(
              onPressed: () {
                text_to_image(controller.text, context);
              },
              child: Text("Genarat"))
        ],
      ),
    );
  }
}
