import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage(name : 'AuthenticationModuleRoute', deferredLoading : true)

class  AuthenticationModule extends StatelessWidget {
  
const AuthenticationModule({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

}
