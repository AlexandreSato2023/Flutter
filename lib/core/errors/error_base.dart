import 'package:equatable/equatable.dart';

abstract class ErrorBase extends Equatable {
  @override
  List<Object> get props => [];
}

// General errors
class ServerErrors extends ErrorBase {}

//Exceptions
class ServerException implements Exception {}