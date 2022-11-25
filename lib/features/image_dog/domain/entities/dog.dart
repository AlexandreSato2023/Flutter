import 'package:equatable/equatable.dart';
class Dog extends Equatable {
  final String imageDog;

  const Dog({required this.imageDog});

  @override
  List<Object> get props => [imageDog];
}
