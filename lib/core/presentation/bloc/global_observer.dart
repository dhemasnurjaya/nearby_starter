import 'dart:developer' as dev;

import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    dev.log("[bloc_error] $bloc\nerror: $error\nstacktrace: $stackTrace");
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    final observeExclusions = [
      // ConnectionBloc,
      // ConnectionMessageBloc,
      // PeerSyncBloc,
    ];

    if (!observeExclusions.contains(bloc.runtimeType)) {
      dev.log(
        "[${bloc.runtimeType}] ${DateTime.now().toIso8601String()}\nFrom: ${change.currentState}\nNext: ${change.nextState}",
      );
    }
    super.onChange(bloc, change);
  }
}
