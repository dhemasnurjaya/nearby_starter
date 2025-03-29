import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nearby_starter/presentation/bloc/permissions/permissions_bloc.dart';
import 'package:nearby_starter/presentation/bloc/registration/registration_bloc.dart';
import 'package:nearby_starter/presentation/routes/app_router.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _userNameController = TextEditingController();

  late RegistrationBloc _registrationBloc;
  late PermissionsBloc _permissionsBloc;

  @override
  void initState() {
    super.initState();

    _registrationBloc = GetIt.I<RegistrationBloc>();
    _permissionsBloc = GetIt.I<PermissionsBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<RegistrationBloc, RegistrationState>(
          bloc: _registrationBloc,
          listener: (context, state) {
            if (state is UserRegistered) {
              _permissionsBloc.add(RequestPermissionsEvent());
            }
          },
        ),
        BlocListener<PermissionsBloc, PermissionsState>(
          bloc: _permissionsBloc,
          listener: (context, state) {
            if (state is PermissionsGranted) {
              context.router.replace(HomeRoute());
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text('Welcome!')),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: _userNameController),
              ElevatedButton(onPressed: () {}, child: Text('Register')),
            ],
          ),
        ),
      ),
    );
  }
}
