part of 'peer_sync_bloc.dart';

abstract class PeerSyncState extends Equatable {
  const PeerSyncState();

  @override
  List<Object?> get props => [];
}

class PeerSyncInitial extends PeerSyncState {
  const PeerSyncInitial();
}

class PeerSyncLoading extends PeerSyncState {
  const PeerSyncLoading();
}

class PeerSyncDone extends PeerSyncState {
  const PeerSyncDone();
}

class PeerSyncError extends PeerSyncState implements ErrorState {
  const PeerSyncError(this.errorMessage);

  @override
  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
