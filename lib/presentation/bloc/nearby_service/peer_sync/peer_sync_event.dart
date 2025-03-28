part of 'peer_sync_bloc.dart';

abstract class PeerSyncEvent extends Equatable {
  const PeerSyncEvent();

  @override
  List<Object?> get props => [];
}

class SyncWithPeersEvent extends PeerSyncEvent {
  const SyncWithPeersEvent();
}
