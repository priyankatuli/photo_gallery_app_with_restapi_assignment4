
import 'package:flutter/material.dart';
import 'package:photo_gallery_app_with_restapi_assignment4/photo_gallery_screen.dart';

class PhotoGalleryApp extends StatelessWidget {

  const PhotoGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Photo Gallery App',
      debugShowCheckedModeBanner: false,
      home: const PhotoGalleryScreen(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white
        )
      ),
    );
  }


}
