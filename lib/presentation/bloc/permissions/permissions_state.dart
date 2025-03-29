part of 'permissions_bloc.dart';

abstract class PermissionsState extends Equatable {
  const PermissionsState();

  @override
  List<Object?> get props => [];
}

class PermissionsInitial extends PermissionsState {
  const PermissionsInitial();
}

class PermissionsLoading extends PermissionsState {
  const PermissionsLoading();
}

class PermissionsGranted extends PermissionsState {
  const PermissionsGranted();
}

class PermissionsError extends PermissionsState implements ErrorState {
  const PermissionsError({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
