import 'package:flutter/material.dart';

class ArchAppButton extends StatelessWidget {
  const ArchAppButton({Key? key, required this.textButton, required this.onPressed}) : super(key: key);
 
  final VoidCallback? onPressed;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.deepPurple,
      splashColor: Colors.grey,
      onPressed: onPressed,
      shape: const StadiumBorder(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.donut_large,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              textButton,
              maxLines: 1,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
