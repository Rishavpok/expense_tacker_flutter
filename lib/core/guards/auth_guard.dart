import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker/services/token_service.dart';

import '../../routes/app_routes.gr.dart';

class IsAuthorizedGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // Check if the token exists

    final token = await TokenService.getToken();

    if (token != null) {
      resolver.next(true);
    } else {
      router.pushAndPopUntil(
        const HomeScreenRoute(),
        predicate: (route) => false,
      );
    }
  }
}

class IsNotAuthorized extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // Check if the token exists
    final token = await TokenService.getToken();
    if (token != null) {
      router.replace(const HomeScreenRoute());
    } else {
      resolver.next(true);
    }
  }
}
