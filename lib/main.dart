import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby_starter/presentation/routes/app_router.dart';
import 'package:nearby_starter/presentation/services/nearby_service.dart';

import 'core/presentation/bloc/global_observer.dart';
import 'injection_container.dart' as ic;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // setup injection container
  await ic.setup();

  // register bloc observer
  Bloc.observer = GlobalObserver();

  runApp(NearbyStarterApp());
}

class NearbyStarterApp extends StatelessWidget {
  NearbyStarterApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return NearbyService(
      child: MaterialApp.router(
        title: 'NC Starter',
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
