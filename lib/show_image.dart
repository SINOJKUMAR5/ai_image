import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class show_image extends StatefulWidget {
  final Uint8List image;
  const show_image({super.key, required this.image});

  @override
  State<show_image> createState() => _show_imageState();
}

// ignore: camel_case_types
class _show_imageState extends State<show_image> {
  List<dynamic> images = [];

  @override
  void initState() {
    images.add(widget.image);
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Image.memory(
                widget.image,
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0, 0.6])),
            )
          ]),
          Expanded(
            child: ListView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: MemoryImage(images[0]),
                            fit: BoxFit.fill,
                            filterQuality: FilterQuality.high)),
                  );
                }),
          )
        ],
      ),
    );
  }
}
