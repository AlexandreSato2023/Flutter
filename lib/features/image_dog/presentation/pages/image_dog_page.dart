import 'package:examplearch/features/image_dog/presentation/bloc/image_dog_bloc.dart';
import 'package:examplearch/features/image_dog/presentation/widgets/control_get_dog_image.dart';
import 'package:examplearch/features/image_dog/presentation/widgets/message_display.dart';
import 'package:examplearch/service_locator.dart';
import 'package:examplearch_design/atoms/loading_arch.dart';
import 'package:examplearch_design/molecules/image_network_arch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageDogPage extends StatelessWidget {
  const ImageDogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Dog Image'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<ImageDogBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<ImageDogBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              BlocBuilder<ImageDogBloc, ImageDogState>(
                builder: (context, state) {
                  if (state is EmptyState) {
                    return const MessageDisplay(
                      message: 'Start searching!',
                    );
                  } else if (state is LoadingState) {
                    return const ArchAppLoadingWidget();
                  } else if (state is LoadedState) {
                    return ArchAppNetworkImage(path: state.dog.imageDog);
                  } else if (state is ErrorState) {
                    return MessageDisplay(
                      message: state.error,
                    );
                  }
                  return Container();
                },
              ),
              const Padding(padding: EdgeInsets.all(10), child: ControlGetDogImgWidget())
            ],
          ),
        ),
      ),
    );
  }
}
