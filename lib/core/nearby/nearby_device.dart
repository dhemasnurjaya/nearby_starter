import 'package:equatable/equatable.dart';

class NearbyDevice extends Equatable {
  final String id;
  final String name;

  const NearbyDevice({required this.id, required this.name});

  @override
  String toString() => 'NearbyDevice(id: $id, name: $name)';

  @override
  List<Object?> get props => [id, name];
}
