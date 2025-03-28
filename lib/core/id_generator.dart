import 'package:uuid/uuid.dart';

abstract class IdGenerator {
  /// Generate unique id
  String generateId();
}

class IdGeneratorImpl implements IdGenerator {
  @override
  String generateId() {
    return const Uuid().v4();
  }
}
