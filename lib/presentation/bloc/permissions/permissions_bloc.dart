import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby_starter/core/domain/no_params.dart';
import 'package:nearby_starter/core/presentation/bloc/error_state.dart';
import 'package:nearby_starter/domain/usecases/request_permissions.dart';

part 'permissions_event.dart';
part 'permissions_state.dart';

class PermissionsBloc extends Bloc<PermissionsEvent, PermissionsState> {
  PermissionsBloc({required RequestPermissions requestPermissions})
    : _requestPermissions = requestPermissions,
      super(const PermissionsInitial()) {
    on<RequestPermissionsEvent>(_onRequestPermissions);
  }

  final RequestPermissions _requestPermissions;

  FutureOr<void> _onRequestPermissions(
    RequestPermissionsEvent event,
    Emitter<PermissionsState> emit,
  ) async {
    emit(const PermissionsLoading());
    final result = await _requestPermissions(const NoParams());
    result.fold(
      (failure) => emit(PermissionsError(errorMessage: failure.message)),
      (_) => emit(const PermissionsGranted()),
    );
  }
}
