# ExampleArch

## Modelo inicial de projeto usando Clean Architecture

### Este projeto é um modelo inicial de Clean Architecture com Google Flutter. 
### O Aplicativo consiste em obter uma imagem de um cachorro do serviço API [Dog.Ceo](https://dog.ceo/) utilizando de boas práticas de desenvolvimento e Clean Architecture.

<br>

## Clean Architecture

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
    features -> image_dog -> data -> datasources
    - ImageDogDataSourceImpl.dart


<br>

## Tecnologia e recursos utilizados

* Gerenciamento de estado BloC
* Design System (Atomic Design)
* Dartz / Either
* Consumo de API Reast
* Injeção de Dependência (GetIt)
* TDD - testes unitários 
* Testes com Coverage
* Mock com [Mockito](https://pub.dev/packages/mockito)