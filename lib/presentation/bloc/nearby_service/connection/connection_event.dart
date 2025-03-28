part of 'connection_bloc.dart';

abstract class ConnectionEvent extends Equatable {
  const ConnectionEvent();

  @override
  List<Object?> get props => [];
}

class SendConnectionRequestsEvent extends ConnectionEvent {
  final String username;

  const SendConnectionRequestsEvent(this.username);

  @override
  List<Object?> get props => [username];
}
