import 'package:dartz/dartz.dart';
import 'package:examplearch/core/errors/error_base.dart';
import 'package:examplearch/core/usecase/usecase_base.dart';
import 'package:examplearch/features/image_dog/domain/entities/dog.dart';
import 'package:examplearch/features/image_dog/domain/repositories/image_dog_repository.dart';

class GetImageDogUseCase implements UseCase<Dog, NoParams> {
  final ImageDogRepository repository;

  GetImageDogUseCase(this.repository);

  @override
  Future<Either<ErrorBase, Dog>> call(NoParams params) async {
    return await repository.getImageDog();
  }
}
