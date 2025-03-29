import 'dart:async';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nearby_starter/core/domain/no_params.dart';
import 'package:nearby_starter/core/either_extensions.dart';
import 'package:nearby_starter/domain/usecases/start_advertising.dart';
import 'package:nearby_starter/domain/usecases/start_discovering.dart';
import 'package:nearby_starter/domain/usecases/stop_advertising.dart';
import 'package:nearby_starter/domain/usecases/stop_discovering.dart';
import 'package:nearby_starter/presentation/bloc/nearby_service/connection/connection_bloc.dart';
import 'package:random_name_generator/random_name_generator.dart';

/// Nearby Connections service that always run throughout the app's lifecycle.
/// Responsible for starting advertising and discovering nearby devices,
/// automatic connection request and processing messages.
class NearbyService extends StatefulWidget {
  const NearbyService({required this.child, super.key});

  final Widget child;

  @override
  State<NearbyService> createState() => _NearbyServiceState();
}

class _NearbyServiceState extends State<NearbyService>
    with WidgetsBindingObserver {
  Timer? _connectionTimer;
  Timer? _dataSyncTimer;
  Timer? _processMessageTimer;

  late String username;
  late ConnectionBloc _connectionBloc;

  late StartAdvertising _startAdvertising;
  late StopAdvertising _stopAdvertising;
  late StartDiscovering _startDiscovering;
  late StopDiscovering _stopDiscovering;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    username = RandomNames().name();
    _connectionBloc = GetIt.I<ConnectionBloc>();

    _startAdvertising = GetIt.I<StartAdvertising>();
    _stopAdvertising = GetIt.I<StopAdvertising>();
    _startDiscovering = GetIt.I<StartDiscovering>();
    _stopDiscovering = GetIt.I<StopDiscovering>();

    _startService();
  }

  @override
  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    await _stopService();
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    // TODO: opening android status bar causes app state changed to `inactive`
    //  then closing it causes app state changed to `resumed`

    if (state == AppLifecycleState.resumed) {
      await _startService();
    }

    if (state == AppLifecycleState.paused) {
      await _stopService();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  Future<void> _stopService() async {
    dev.log("Stopping nearby service");

    await _stopAdvertising(
      const NoParams(),
    ).chain((_) => _stopDiscovering(const NoParams()));

    _connectionTimer?.cancel();
    _connectionTimer = null;

    _dataSyncTimer?.cancel();
    _dataSyncTimer = null;

    _processMessageTimer?.cancel();
    _processMessageTimer = null;

    dev.log("Stopped nearby service");
  }

  Future<void> _startService() async {
    dev.log('Starting nearby service');

    // advertisement & discovery
    await _startAdvertising(
      StartAdvertisingParams(username),
    ).chain((_) => _startDiscovering(StartDiscoveringParams(username)));

    // request connection
    _connectionTimer = Timer.periodic(Duration(seconds: 1), (_) {
      _connectionBloc.add(SendConnectionRequestsEvent(username));
    });

    /*
    // data sync
    _dataSyncTimer = Timer.periodic(
      const Duration(milliseconds: 1000),
      (_) {
        GetIt.I<PeerSyncBloc>().add(const SyncWithPeersEvent());
      },
    );

    // process messages
    _processMessageTimer = Timer.periodic(
      const Duration(milliseconds: 500),
      (_) => GetIt.I<ConnectionMessageBloc>().add(
        const ProcessConnectionMessagesEvent(),
      ),
    );
    */
  }
}
