import 'package:examplearch/features/image_dog/presentation/bloc/image_dog_bloc.dart';
import 'package:examplearch_design/atoms/button_default_arch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ControlGetDogImgWidget extends StatelessWidget {
  const ControlGetDogImgWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
          child: ArchAppButton(
        textButton: 'Get Image',
        onPressed: (() {
          BlocProvider.of<ImageDogBloc>(context).add(GetImageDogEvent());
        }),
      )),
    );
  }
}
