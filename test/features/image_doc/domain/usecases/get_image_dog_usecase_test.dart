import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:examplearch/core/errors/error_base.dart';
import 'package:examplearch/core/usecase/usecase_base.dart';
import 'package:examplearch/features/image_dog/data/datasources/image_dog_datasource_impl.dart';
import 'package:examplearch/features/image_dog/data/models/dog_dto.dart';
import 'package:examplearch/features/image_dog/data/repositories/image_dog_repository_impl.dart';
import 'package:examplearch/features/image_dog/domain/usecases/get_image_dog_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../fixtures/fix_services.dart';
import '../../data/repositories/image_dog_data_repository_test.mocks.dart';

@GenerateMocks([ImageDogDataSourceImpl])
@GenerateMocks([ImageDogRepositoryImpl])
void main() {
  late GetImageDogUseCase usecase;
  late MockImageDogRepositoryImpl repository;

  final vModel = DogDTO.fromJson(json.decode(fixture('dog_image_json.json')));

  setUp(() {
    repository = MockImageDogRepositoryImpl();
    usecase = GetImageDogUseCase(repository);
  });

  test(
    'deve obter uma imagem do repositorio',
    () async {
      when(repository.getImageDog()).thenAnswer((_) async => Right(vModel));

      final result = await usecase(NoParams());

      expect(result, Right(vModel));
      verify(repository.getImageDog());
      verifyNoMoreInteractions(repository);
    },
  );

  test(
    'falha em obter uma imagem do repositorio',
    () async {
      when(repository.getImageDog()).thenAnswer((_) async => Left(ServerErrors()));

      final result = await usecase(NoParams());

      verify(repository.getImageDog());
      expect(result, Left(ServerErrors()));
      verifyNoMoreInteractions(repository);
    },
  );
}
