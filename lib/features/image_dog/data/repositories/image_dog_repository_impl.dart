import 'package:examplearch/features/image_dog/data/datasources/image_dog_datasource.dart';
import 'package:examplearch/features/image_dog/domain/entities/dog.dart';
import 'package:examplearch/core/errors/error_base.dart';
import 'package:dartz/dartz.dart';
import 'package:examplearch/features/image_dog/domain/repositories/image_dog_repository.dart';

class ImageDogRepositoryImpl implements ImageDogRepository {
  final ImageDogDataSource dataSource;

  ImageDogRepositoryImpl({required this.dataSource});

  @override
  Future<Either<ErrorBase, Dog>> getImageDog() async {
    return await _getDogImage();
  }

  Future<Either<ErrorBase, Dog>> _getDogImage() async {
    try {
      var response = await dataSource.getImageDog();
      return Right(response);
    } on ServerException {
      return Left(ServerErrors());
    } on Exception {
      return Left(ServerErrors());
    }
  }
}
