import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby_starter/core/domain/no_params.dart';
import 'package:nearby_starter/core/presentation/bloc/error_state.dart';
import 'package:nearby_starter/domain/usecases/sync_with_peers.dart';

part 'peer_sync_event.dart';
part 'peer_sync_state.dart';

class PeerSyncBloc extends Bloc<PeerSyncEvent, PeerSyncState> {
  PeerSyncBloc({required this.syncWithPeers}) : super(const PeerSyncInitial()) {
    on<SyncWithPeersEvent>(_onSyncWithPeers, transformer: droppable());
  }

  final SyncWithPeers syncWithPeers;

  FutureOr<void> _onSyncWithPeers(
    SyncWithPeersEvent event,
    Emitter<PeerSyncState> emit,
  ) async {
    emit(const PeerSyncLoading());
    final result = await syncWithPeers(NoParams());
    result.fold(
      (error) => emit(PeerSyncError(error.message)),
      (_) => emit(const PeerSyncDone()),
    );
  }
}
