import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nearby_starter/presentation/bloc/permissions/permissions_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PermissionsBloc _permissionsBloc;

  @override
  void initState() {
    super.initState();

    _permissionsBloc = GetIt.I<PermissionsBloc>();
    _permissionsBloc.add(RequestPermissionsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nearby Connections Starter')),
      body: Center(child: Text('Welcome to Nearby Connections Starter!')),
    );
  }
}
