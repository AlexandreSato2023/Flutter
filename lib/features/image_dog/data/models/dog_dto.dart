import 'package:examplearch/features/image_dog/domain/entities/dog.dart';

class DogDTO extends Dog {
  const DogDTO({required String imageDog}) : super(imageDog: imageDog);

  factory DogDTO.fromJson(Map<String, dynamic> json) {
    return DogDTO(imageDog: json['message']);
  }

  Map<String, dynamic> toJson() {
    return {'imageDog': imageDog};
  }
}
