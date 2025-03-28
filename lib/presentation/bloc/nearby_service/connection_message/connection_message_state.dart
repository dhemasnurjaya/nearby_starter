part of 'connection_message_bloc.dart';

abstract class ConnectionMessageState extends Equatable {
  const ConnectionMessageState();

  @override
  List<Object?> get props => [];
}

class ConnectionMessageInitial extends ConnectionMessageState {
  const ConnectionMessageInitial();
}

class ConnectionMessageLoading extends ConnectionMessageState {
  const ConnectionMessageLoading();
}

class ConnectionMessagesProcessed extends ConnectionMessageState {
  const ConnectionMessagesProcessed();
}

class ConnectionMessageError extends ConnectionMessageState
    implements ErrorState {
  const ConnectionMessageError(this.errorMessage);

  @override
  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
