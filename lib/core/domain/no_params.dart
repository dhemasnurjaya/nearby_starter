import 'package:equatable/equatable.dart';

/// An empty parameter class
/// Used when a use case does not require any parameters
class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
