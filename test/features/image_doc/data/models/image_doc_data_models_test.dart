import 'dart:convert';
import 'package:examplearch/features/image_dog/data/models/dog_dto.dart';
import 'package:examplearch/features/image_dog/domain/entities/dog.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../fixtures/fix_services.dart';

void main() {
  const vModel = DogDTO(imageDog: 'https://images.dog.ceo/breeds/poodle-standard/n02113799_5514.jpg');

  test(
    'Deve ser uma subclass de Dog',
    () async {
      expect(vModel, isA<Dog>());
    },
  );

  group('fromJson', () {
    test(
      'deve retornar uma model válida com a url String',
      () async {
        final Map<String, dynamic> jsonMap = json.decode(fixture('dog_image_json.json'));

        final result = DogDTO.fromJson(jsonMap);

        expect(result, vModel);
      },
    );

    group('toJson', () {
      test(
        'deve retornar um JSON map contendo a propriedade imageDog',
        () async {
          final result = vModel.toJson();

          final expectedMap = {"imageDog": "https://images.dog.ceo/breeds/poodle-standard/n02113799_5514.jpg"};

          expect(result, expectedMap);
        },
      );
    });
  });
}
