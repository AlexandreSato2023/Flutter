import 'package:dartz/dartz.dart';
import 'package:examplearch/core/errors/error_base.dart';
import 'package:examplearch/core/usecase/usecase_base.dart';
import 'package:examplearch/features/image_dog/domain/entities/dog.dart';
import 'package:examplearch/features/image_dog/domain/usecases/get_image_dog_usecase.dart';
import 'package:examplearch/features/image_dog/presentation/bloc/image_dog_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'image_dog_bloc_test.mocks.dart';

@GenerateMocks([GetImageDogEvent])
@GenerateMocks([GetImageDogUseCase])
void main() {
  ImageDogBloc? bloc;
  GetImageDogUseCase? mockGetImageDogUseCase;
  GetImageDogEvent? mockGetImageDogEvent;

  setUp(() {
    mockGetImageDogUseCase = MockGetImageDogUseCase();
    mockGetImageDogEvent = MockGetImageDogEvent();

    bloc = ImageDogBloc(getImageDogUseCase: mockGetImageDogUseCase!);
  });

  test('Estado inicial deve ser vazio', () {
    // assert
    expect(bloc!.state, equals(EmptyState()));
  });

  group('Obtem uma entidade DOG !', () {
    var dog = const Dog(imageDog: 'https://images.dog.ceo/breeds/poodle-standard/n02113799_5514.jpg');

    test(
      'retorna a imagem do usecase com sucesso!',
      () async {

        when(mockGetImageDogUseCase!(NoParams())).thenAnswer((_) async => Right(dog));

        bloc!.add(mockGetImageDogEvent!);

        await untilCalled(mockGetImageDogUseCase!(NoParams()));

        verify(mockGetImageDogUseCase!(NoParams()));
        
      },
    );

  

    


  });
}
