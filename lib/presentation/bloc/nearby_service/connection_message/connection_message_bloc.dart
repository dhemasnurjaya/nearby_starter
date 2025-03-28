import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby_starter/core/domain/no_params.dart';
import 'package:nearby_starter/core/presentation/bloc/error_state.dart';
import 'package:nearby_starter/domain/usecases/process_messages.dart';

part 'connection_message_event.dart';
part 'connection_message_state.dart';

class ConnectionMessageBloc
    extends Bloc<ConnectionMessageEvent, ConnectionMessageState> {
  ConnectionMessageBloc({required this.processMessages})
    : super(const ConnectionMessageInitial()) {
    on<ProcessConnectionMessagesEvent>(
      _onProcessConnectionMessages,
      transformer: droppable(),
    );
  }

  final ProcessMessages processMessages;

  FutureOr<void> _onProcessConnectionMessages(
    ProcessConnectionMessagesEvent event,
    Emitter<ConnectionMessageState> emit,
  ) async {
    emit(const ConnectionMessageLoading());
    final result = await processMessages(const NoParams());
    result.fold(
      (error) => emit(ConnectionMessageError(error.message)),
      (_) => emit(const ConnectionMessagesProcessed()),
    );
  }
}
