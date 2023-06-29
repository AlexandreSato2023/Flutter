import 'package:flutter/material.dart';

class ArchAppNetworkImage extends StatelessWidget {
  final String path;

  const ArchAppNetworkImage({
    Key? key,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Image imageNet = Image.network(
      path,
      fit: BoxFit.fill,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
          ),
        );
      },
      errorBuilder: (_, __, ___) {
        return const Icon(Icons.image_not_supported);
      },
    );

    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        image: DecorationImage(fit: BoxFit.fill, image: imageNet.image),
      ),
    );
  }
}
