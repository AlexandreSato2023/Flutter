import 'package:examplearch/features/image_dog/data/datasources/image_dog_datasource.dart';
import 'package:examplearch/features/image_dog/data/datasources/image_dog_datasource_impl.dart';
import 'package:examplearch/features/image_dog/data/repositories/image_dog_repository_impl.dart';
import 'package:examplearch/features/image_dog/domain/repositories/image_dog_repository.dart';
import 'package:examplearch/features/image_dog/domain/usecases/get_image_dog_usecase.dart';
import 'package:examplearch/features/image_dog/presentation/bloc/image_dog_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

Future<void> load() async {
  serviceLocator.registerFactory(
    () => ImageDogBloc(
      getImageDogUseCase: serviceLocator(),
    ),
  );

  // Use cases
  serviceLocator.registerLazySingleton(() => GetImageDogUseCase(serviceLocator()));

  // Repository
  serviceLocator.registerLazySingleton<ImageDogRepository>(
    () => ImageDogRepositoryImpl(dataSource: serviceLocator()),
  );

  // Data sources
  serviceLocator.registerLazySingleton<ImageDogDataSource>(
    () => ImageDogDataSourceImpl(client: serviceLocator()),
  );

  //! External
  //final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => http.Client());
}
