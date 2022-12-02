import 'package:dartz/dartz.dart';
import 'package:examplearch/core/errors/error_base.dart';
import 'package:examplearch/features/image_dog/data/datasources/image_dog_datasource_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../domain/usecases/get_image_dog_usecase_test.mocks.dart';

@GenerateMocks([ImageDogDataSourceImpl])
void main() {

  final imageDogDataSouceImpl = ImageDogDataSourceImpl(client: http.Client());
  final datasourceMock = MockImageDogDataSourceImpl();

  group('obtem uma imagem de cachorro datasource', () {
    
    test(
      'obtem uma imagem de cachorro do datasourcecom sucesso!',
      () async {
        var ret = await imageDogDataSouceImpl.getImageDog();

        expect(ret, isNotNull);
        expect(ret.imageDog, isNotNull);
        expect(ret.imageDog, isNotEmpty);       
        
      },
    );

    test(
      'obtem uma imagem de cachorro do datasource com erro utilizando Mock!',
      () async {

      when(datasourceMock.getImageDog()).thenThrow((_) async => Exception());

      final result = await datasourceMock.getImageDog();

      // verify(datasourceMock.getImageDog());
      // expect(result, throwsA(ServerErrors()));
      // verifyNoMoreInteractions(datasourceMock);
                
      },
    );

  });
}
