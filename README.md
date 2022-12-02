# ExampleArch

## Modelo inicial de projeto usando Clean Architecture

### Este projeto é um modelo inicial de Clean Architecture com Google Flutter. 
### O Aplicativo consiste em obter uma imagem de um cachorro do serviço API [Dog.Ceo](https://dog.ceo/) utilizando de boas práticas de desenvolvimento e Clean Architecture.

<br>

# Clean Architecture

### Robert C. Martin foi o criador da Clean Architecture, que é uma das filosofias de arquiteturas disponíveis para o desenvolvimento de softwares. Com essa abordagem conseguimos produzir sistemas mais simples de testar de forma isolada e ao mesmo tempo, ficando mais independente de frameworks, UI, banco de dados e de qualquer agente externo.

<br>

<img src="https://blog.cleancoder.com/uncle-bob/images/2012-08-13-the-clean-architecture/CleanArchitecture.jpg" width="500"> 

https://blog.cleancoder.com

<br>

## Clean Architecture - Aplicação no Projeto Flutter

### Exemplo de estrutura do projeto flutter com Clean Architecture:

<br>

### Enterprise Businnes Rules
    features -> image_dog -> domain -> entities 
    - Dog.dart
### Application Business Rules
    features -> image_dog -> domain -> usecases
    - GetImageDogUseCase.dart
### Interface Adapters
    features -> image_dog -> presentation -> bloc
    - ImageDogBloc.dart
#### Frameworks & Drivers
    features -> image_dog -> presentation -> pages
    - ImageDogPage.dart
    features -> image_dog -> data -> repositories
    - ImageDogRepositoryImpl.dart
<br>

# Tecnologia e recursos utilizados

## Design System (Atomic Design)

### O Atomic Design é uma metodologia criada por Brad Frost e que utiliza elementos da química, como atomos e moléculas, para criar e separar elementos que são aplicados no design de interfaces.

### https://atomicdesign.bradfrost.com/

### Neste exemplo temos Widget do Desing System:

```dart
   return const ArchAppLoadingWidget();
} else if (state is LoadedState) {
   return ArchAppNetworkImage(path: state.dog.imageDog);
```

## Gerenciamento de estado BloC

### BloC (Business Logic Component) é um padrão que adiciona reatividade aos componentes de uma aplicação e foi criado com o objetivo de separar regras de negócios e interface de usuário. O BloC auxilia no gerenciamento de estado da aplicação, tendo vantagem e desvantagens em sua aplicação, mas não é a única opção disponível, segue a lista que o Google apresenta no site oficial do Flutter:

### https://docs.flutter.dev/development/data-and-backend/state-mgmt/options 

```dart
ImageDogBloc({required this.getImageDogUseCase}) : super(EmptyState()) {
    on<GetImageDogEvent>((event, emit) async {
      emit(LoadingState());
      final errorOrImageDog = await getImageDogUseCase(NoParams());

      await errorOrImageDog.fold(
        (errorMessage) async {
          emit(ErrorState(error: mapErrorsToMessage(errorMessage)));
        },
        (dogImage) async {
          emit(LoadedState(dog: dogImage));
        },
      );
    });
}
```

## Injeção de Dependência

### Utilização do package GetIt para melhorar o desacoplamento do aplicativo e auxiliar na realização dos testes unitários

```dart
  serviceLocator.registerLazySingleton<ImageDogRepository>(
    () => ImageDogRepositoryImpl(dataSource: serviceLocator()),
  );
```
<br>

## Testes
### TDD - testes unitários - Coverage

```dart
 test(
    'deve obter uma imagem do repositorio',
    () async {
      when(repository.getImageDog()).thenAnswer((_) async => Right(vModel));

      final result = await usecase(NoParams());

      expect(result, Right(vModel));
      verify(repository.getImageDog());
    
    },
  );
```
### Mock com [Mockito](https://pub.dev/packages/mockito)

```dart
test(
      'deve retornar uma imagem de cachorro com sucesso',
      () async {
        when(datasourceMock.getImageDog()).thenAnswer((_) async => vModel);

        final result = await repositoryMock.getImageDog();

        verify(datasourceMock.getImageDog());

        expect(result, equals(Right(vModel)));
      },
    );
```
