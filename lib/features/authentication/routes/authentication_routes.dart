import 'package:auto_route/auto_route.dart';
import '../../../routes/app_routes.gr.dart';
final List<AutoRoute> authenticationRoutes = [
  AutoRoute(
    page:LoginScreenRoute.page ,
    path:'login'
    ),
      AutoRoute(
    page:RegistrationScreenRoute.page ,
    path:'registration'
    )
];
