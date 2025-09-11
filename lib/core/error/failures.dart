import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class InvalidInputFailure extends Failure {
  const InvalidInputFailure() : super('Invalid input');
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure([String? message])
      : super(message ?? 'Unexpected error occurred');
}
