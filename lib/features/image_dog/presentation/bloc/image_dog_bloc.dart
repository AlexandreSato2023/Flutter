import 'package:equatable/equatable.dart';
import 'package:examplearch/core/errors/error_base.dart';
import 'package:examplearch/core/usecase/usecase_base.dart';
import 'package:examplearch/features/image_dog/domain/entities/dog.dart';
import 'package:examplearch/features/image_dog/domain/usecases/get_image_dog_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'image_dog_event.dart';
part 'image_dog_state.dart';

class ImageDogBloc extends Bloc<ImageDogEvent, ImageDogState> {
  final GetImageDogUseCase getImageDogUseCase;

  ImageDogBloc({required this.getImageDogUseCase}) : super(EmptyState()) {
    on<GetImageDogEvent>((event, emit) async {
      emit(LoadingState());
      final errorOrImageDog = await getImageDogUseCase(NoParams());

      await errorOrImageDog.fold(
        (errorMessage) async {
          emit(ErrorState(error: mapErrorsToMessage(errorMessage)));
        },
        (dogImage) async {
          emit(LoadedState(dog: dogImage));
        },
      );
    });
  }

  String mapErrorsToMessage(ErrorBase erro) {
    switch (erro.runtimeType) {
      case ServerErrors:
        return "Falha no servidor!";
      default:
        return 'Erro desconhecido!';
    }
  }
}
