import 'package:examplearch/features/image_dog/presentation/pages/image_dog_page.dart';
import 'package:examplearch_design/theme/wisecons_theme.dart';
import 'package:flutter/material.dart';
import 'package:examplearch/service_locator.dart' as service_locator;

Future<void> main() async {
  await service_locator.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image DOG',
      theme: ArchAppTheme.themeData(),
      home: const ImageDogPage(),
    );
  }
}
