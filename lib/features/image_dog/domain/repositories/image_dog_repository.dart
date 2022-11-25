import 'package:dartz/dartz.dart';
import 'package:examplearch/core/errors/error_base.dart';
import 'package:examplearch/features/image_dog/domain/entities/dog.dart';

abstract class ImageDogRepository {
  Future<Either<ErrorBase, Dog>> getImageDog();  
}