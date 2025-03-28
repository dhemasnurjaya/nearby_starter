import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final Exception? cause;

  const Failure({this.message = '', this.cause});

  @override
  List<Object?> get props => [message, cause];
}

/// Failure occurring in the communication data layer
class CommunicationFailure extends Failure {
  const CommunicationFailure({super.message, super.cause});
}

/// Failure occurring from an unknown source.
/// This is usually for cases where we catch a regular Exception class.
class UnknownFailure extends Failure {
  const UnknownFailure({super.message, super.cause});
}

/// Failure occurring in the local data layer
class CacheFailure extends Failure {
  const CacheFailure({super.message, super.cause});
}
