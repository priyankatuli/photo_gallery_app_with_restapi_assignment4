import 'package:device_preview_minus/device_preview_minus.dart';
import 'package:flutter/material.dart';
import 'package:photo_gallery_app_with_restapi_assignment4/app.dart';

void main(){
  runApp(
    DevicePreview(
    builder: (context) => const PhotoGalleryApp(),
  ),
  );
}