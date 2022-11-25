import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:examplearch/core/errors/error_base.dart';
import 'package:examplearch/features/image_dog/data/datasources/image_dog_datasource_impl.dart';
import 'package:examplearch/features/image_dog/data/models/dog_dto.dart';
import 'package:examplearch/features/image_dog/data/repositories/image_dog_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../fixtures/fix_services.dart';
import 'image_dog_data_repository_test.mocks.dart';

@GenerateMocks([ImageDogRepositoryImpl])
@GenerateMocks([ImageDogDataSourceImpl])
void main() {
  final datasourceMock = MockImageDogDataSourceImpl();
  final repositoryMock = ImageDogRepositoryImpl(dataSource: datasourceMock);

  group('obtem uma imagem de cachorro', () {
    final vModel = DogDTO.fromJson(json.decode(fixture('dog_image_json.json')));

    test(
      'deve retornar uma imagem de cachorro com sucesso',
      () async {
        when(datasourceMock.getImageDog()).thenAnswer((_) async => vModel);

        final result = await repositoryMock.getImageDog();

        verify(datasourceMock.getImageDog());

        expect(result, equals(Right(vModel)));
      },
    );

    test(
      'deve retornar uma falha ao tentar obter a imagem de cachorro',
      () async {
        when(await datasourceMock.getImageDog()).thenThrow(ServerException());

        final result = await repositoryMock.getImageDog();

        expect(result, equals(Left(ServerErrors())));
      },
    );
  });
}
