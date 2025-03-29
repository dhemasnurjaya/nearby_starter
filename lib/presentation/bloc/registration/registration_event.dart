part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object?> get props => [];
}

class RegisterUserEvent extends RegistrationEvent {
  const RegisterUserEvent({required this.user});

  final User user;

  @override
  List<Object?> get props => [user];
}
