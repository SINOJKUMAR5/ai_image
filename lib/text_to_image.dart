import 'dart:convert';
import 'dart:typed_data';

import 'package:ai_image/show_image.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

// ignore: non_constant_identifier_names
Future<dynamic> text_to_image(String promot, BuildContext context) async {
  try {
    Uint8List data_image = Uint8List(0);

    const engine_id = "stable-diffusion-v1-6";
    final response = await http.post(
        Uri.parse(
            "https://api.stability.ai/v1/generation/${engine_id}/text-to-image"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "image/png",
          "Authorization":
              "Bearer sk-ymt1LNROPkKINCwLvqrRkSRWa0WQHTXuBnU96IZjXv8pu93W",
        },
        body: jsonEncode({
          "cfg_scale": 7,
          "clip_guidance_preset": "FAST_BLUE",
          "height": 512,
          "width": 512,
          "sampler": "K_DPM_2_ANCESTRAL",
          "samples": 1,
          "steps": 30,
          "text_prompts": [
            {
              'text': promot.toString(),
              'weight': 1,
            }
          ]
        }));

    if (response.statusCode == 200) {
      try {
        data_image = (response.bodyBytes);

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return show_image(image: data_image);
        }));

        return response.bodyBytes;
      } catch (e) {}
    } else {}
  } catch (e) {
    print(e.toString());
  }
}
