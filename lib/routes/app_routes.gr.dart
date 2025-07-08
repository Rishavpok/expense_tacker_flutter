// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:expense_tracker/features/authentication/authentication_module.dart'
    deferred as _i1;
import 'package:expense_tracker/screens/home_screen.dart' deferred as _i2;
import 'package:expense_tracker/screens/intro_screen.dart' deferred as _i3;
import 'package:expense_tracker/screens/login_screen.dart' deferred as _i4;
import 'package:expense_tracker/screens/registration_screen.dart'
    deferred as _i5;

/// generated route for
/// [_i1.AuthenticationModule]
class AuthenticationModuleRoute extends _i6.PageRouteInfo<void> {
  const AuthenticationModuleRoute({List<_i6.PageRouteInfo>? children})
    : super(AuthenticationModuleRoute.name, initialChildren: children);

  static const String name = 'AuthenticationModuleRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return _i6.DeferredWidget(
        _i1.loadLibrary,
        () => _i1.AuthenticationModule(),
      );
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreenRoute extends _i6.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i6.PageRouteInfo>? children})
    : super(HomeScreenRoute.name, initialChildren: children);

  static const String name = 'HomeScreenRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return _i6.DeferredWidget(_i2.loadLibrary, () => _i2.HomeScreen());
    },
  );
}

/// generated route for
/// [_i3.IntroScreen]
class IntroScreenRoute extends _i6.PageRouteInfo<void> {
  const IntroScreenRoute({List<_i6.PageRouteInfo>? children})
    : super(IntroScreenRoute.name, initialChildren: children);

  static const String name = 'IntroScreenRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return _i6.DeferredWidget(_i3.loadLibrary, () => _i3.IntroScreen());
    },
  );
}

/// generated route for
/// [_i4.LoginScreen]
class LoginScreenRoute extends _i6.PageRouteInfo<void> {
  const LoginScreenRoute({List<_i6.PageRouteInfo>? children})
    : super(LoginScreenRoute.name, initialChildren: children);

  static const String name = 'LoginScreenRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return _i6.DeferredWidget(_i4.loadLibrary, () => _i4.LoginScreen());
    },
  );
}

/// generated route for
/// [_i5.RegistrationScreen]
class RegistrationScreenRoute extends _i6.PageRouteInfo<void> {
  const RegistrationScreenRoute({List<_i6.PageRouteInfo>? children})
    : super(RegistrationScreenRoute.name, initialChildren: children);

  static const String name = 'RegistrationScreenRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return _i6.DeferredWidget(
        _i5.loadLibrary,
        () => _i5.RegistrationScreen(),
      );
    },
  );
}
