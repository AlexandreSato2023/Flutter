import 'package:examplearch/features/image_dog/data/models/dog_dto.dart';

abstract class ImageDogDataSource {
  Future<DogDTO> getImageDog();
}
