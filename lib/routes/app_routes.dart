import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker/core/guards/auth_guard.dart';
import 'package:expense_tracker/features/authentication/routes/authentication_routes.dart';

// import '../features/authentication/';

import 'app_routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  late final IsAuthorizedGuard isAuthorizedGuard = IsAuthorizedGuard();
  late final IsNotAuthorized isNotAuthorized = IsNotAuthorized();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: AuthenticationModuleRoute.page,
      path: '/auth',
      children: authenticationRoutes,
    ),
    AutoRoute(page: IntroScreenRoute.page, path: '/', guards: [isNotAuthorized]),
    AutoRoute(
      page: HomeScreenRoute.page,
      guards: [isAuthorizedGuard],
      path: '/home',
    ),
  ];
}
