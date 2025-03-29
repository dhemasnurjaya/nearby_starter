import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby_starter/core/presentation/bloc/error_state.dart';
import 'package:nearby_starter/domain/entities/user.dart';
import 'package:nearby_starter/domain/usecases/register_user.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc({required RegisterUser registerUser})
    : _registerUser = registerUser,
      super(const RegistrationInitial()) {
    on<RegisterUserEvent>(_onRegisterUser);
  }

  final RegisterUser _registerUser;

  FutureOr<void> _onRegisterUser(
    RegisterUserEvent event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(const RegistrationLoading());
    final result = await _registerUser(RegisterUserParams(user: event.user));
    result.fold(
      (failure) => emit(RegistrationError(errorMessage: failure.message)),
      (_) => emit(UserRegistered(user: event.user)),
    );
  }
}
