abstract class Time {
  DateTime now();
}

class TimeImpl implements Time {
  @override
  DateTime now() {
    return DateTime.now();
  }
}
