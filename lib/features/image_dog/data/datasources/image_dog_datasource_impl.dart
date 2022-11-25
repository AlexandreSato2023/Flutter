import 'dart:convert';

import 'package:examplearch/core/errors/error_base.dart';
import 'package:examplearch/features/image_dog/data/datasources/image_dog_datasource.dart';
import 'package:examplearch/features/image_dog/data/models/dog_dto.dart';
import 'package:http/http.dart' as http;

class ImageDogDataSourceImpl implements ImageDogDataSource {
  final http.Client client;

  ImageDogDataSourceImpl({required this.client});

  @override
  Future<DogDTO> getImageDog() => _getImageDogFromUrl('https://dog.ceo/api/breeds/image/random');

  Future<DogDTO> _getImageDogFromUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return DogDTO.fromJson(json.decode(response.body));
    } else {
      throw ServerErrors();
    }
  }
}
