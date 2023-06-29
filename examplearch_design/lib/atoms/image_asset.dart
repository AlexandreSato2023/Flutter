import 'package:flutter/material.dart';

class ArchAppAssetImage extends StatelessWidget {
  final String path;
  final double widthImage;


  const ArchAppAssetImage(
      {Key? key,
      required this.path,
      required this.widthImage,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget archImage = Image.asset(
      path,
      width: widthImage,
      height: widthImage,
    );
    return archImage;
  }
}