import 'package:auto_route/auto_route.dart';
import 'package:nearby_starter/presentation/pages/home/home_page.dart';
import 'package:nearby_starter/presentation/pages/home/register_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: RegisterRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page),
  ];
}
