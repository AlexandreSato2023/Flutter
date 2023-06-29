
import 'package:examplearch_design/atoms/image_asset.dart';
import 'package:examplearch_design/foundations/colors_foundation.dart';
import 'package:flutter/material.dart';

class ArchAppCardTile extends StatelessWidget {
  final String path;
  final String title;
  final String id;
  final double? height;
  const ArchAppCardTile(
      {Key? key, required this.path, required this.title, required this.id, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 180,
      decoration: BoxDecoration(
          color: ArchAppColorsFoundation.cardBgColor,
          borderRadius: BorderRadius.circular(21)),
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.only(top: 21.0, left: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ArchAppAssetImage(path: path, widthImage: 120),
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 200,
                  padding: const EdgeInsets.fromLTRB(10, 2, 10, 0),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 200,
                  padding: const EdgeInsets.only(left: 34, top: 21),
                  child: Text(id, style: Theme.of(context).textTheme.headline6),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}