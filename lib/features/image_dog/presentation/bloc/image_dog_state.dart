part of 'image_dog_bloc.dart';

class ImageDogState extends Equatable {
  @override
  List<Object> get props => [];
}

class EmptyState extends ImageDogState {}

class LoadingState extends ImageDogState {}

class LoadedState extends ImageDogState {
  final Dog dog;

  LoadedState({required this.dog});

  @override
  List<Object> get props => [dog];
}

class ErrorState extends ImageDogState {
  final String error;

  ErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
