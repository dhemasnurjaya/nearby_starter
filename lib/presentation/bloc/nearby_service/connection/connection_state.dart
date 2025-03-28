part of 'connection_bloc.dart';

abstract class ConnectionState extends Equatable {
  const ConnectionState();

  @override
  List<Object?> get props => [];
}

class ConnectionInitial extends ConnectionState {
  const ConnectionInitial();
}

class ConnectionLoading extends ConnectionState {
  const ConnectionLoading();
}

class ConnectionRequestsSent extends ConnectionState {
  final List<Connection> devices;

  const ConnectionRequestsSent(this.devices);

  @override
  List<Object> get props => [devices];
}

class ConnectionError extends ConnectionState implements ErrorState {
  const ConnectionError(this.errorMessage);

  @override
  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
