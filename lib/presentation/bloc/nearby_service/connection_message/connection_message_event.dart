part of 'connection_message_bloc.dart';

abstract class ConnectionMessageEvent extends Equatable {
  const ConnectionMessageEvent();

  @override
  List<Object?> get props => [];
}

class ProcessConnectionMessagesEvent extends ConnectionMessageEvent {
  const ProcessConnectionMessagesEvent();
}
