import 'package:flutter/material.dart';

class ArchAppLoadingWidget extends StatelessWidget {
  const ArchAppLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: const Center(
        child: SingleChildScrollView(child: CircularProgressIndicator()),
      ),
    );
  }
}
