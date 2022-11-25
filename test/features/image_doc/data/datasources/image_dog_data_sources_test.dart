import 'dart:convert';

import 'package:examplearch/features/image_dog/data/datasources/image_dog_datasource_impl.dart';
import 'package:examplearch/features/image_dog/data/models/dog_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../fixtures/fix_services.dart';
import '../repositories/image_dog_data_repository_test.mocks.dart';

@GenerateMocks([ImageDogDataSourceImpl])
void main() {
  final mockImageDogDataSourceImpl = MockImageDogDataSourceImpl();

  group('obtem uma imagem de cachorro datasource', () {
    final vModel = DogDTO.fromJson(json.decode(fixture('dog_image_json.json')));

    test(
      'obtem uma imagem de cachorro do datasourcecom sucesso!',
      () async {

        when(mockImageDogDataSourceImpl.getImageDog()).thenAnswer((_) async => vModel);

        var ret = await mockImageDogDataSourceImpl.getImageDog();

        verify(mockImageDogDataSourceImpl.getImageDog());

        expect(vModel, ret);
        
        
      },
    );
  });
}
