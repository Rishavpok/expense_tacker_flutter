// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:expense_tracker/features/authentication/authentication_module.dart'
    deferred as _i1;
import 'package:expense_tracker/features/authentication/pages/login_screen.dart'
    deferred as _i5;
import 'package:expense_tracker/features/authentication/pages/registration_screen.dart'
    deferred as _i6;
import 'package:expense_tracker/features/home/home_module.dart' deferred as _i2;
import 'package:expense_tracker/features/home/pages/home_screen.dart'
    deferred as _i3;
import 'package:expense_tracker/screens/intro_screen.dart' deferred as _i4;

/// generated route for
/// [_i1.AuthenticationModule]
class AuthenticationModuleRoute extends _i7.PageRouteInfo<void> {
  const AuthenticationModuleRoute({List<_i7.PageRouteInfo>? children})
    : super(AuthenticationModuleRoute.name, initialChildren: children);

  static const String name = 'AuthenticationModuleRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return _i7.DeferredWidget(
        _i1.loadLibrary,
        () => _i1.AuthenticationModule(),
      );
    },
  );
}

/// generated route for
/// [_i2.HomeModule]
class HomeModuleRoute extends _i7.PageRouteInfo<void> {
  const HomeModuleRoute({List<_i7.PageRouteInfo>? children})
    : super(HomeModuleRoute.name, initialChildren: children);

  static const String name = 'HomeModuleRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return _i7.DeferredWidget(_i2.loadLibrary, () => _i2.HomeModule());
    },
  );
}

/// generated route for
/// [_i3.HomeScreen]
class HomeScreenRoute extends _i7.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i7.PageRouteInfo>? children})
    : super(HomeScreenRoute.name, initialChildren: children);

  static const String name = 'HomeScreenRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return _i7.DeferredWidget(_i3.loadLibrary, () => _i3.HomeScreen());
    },
  );
}

/// generated route for
/// [_i4.IntroScreen]
class IntroScreenRoute extends _i7.PageRouteInfo<void> {
  const IntroScreenRoute({List<_i7.PageRouteInfo>? children})
    : super(IntroScreenRoute.name, initialChildren: children);

  static const String name = 'IntroScreenRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return _i7.DeferredWidget(_i4.loadLibrary, () => _i4.IntroScreen());
    },
  );
}

/// generated route for
/// [_i5.LoginScreen]
class LoginScreenRoute extends _i7.PageRouteInfo<void> {
  const LoginScreenRoute({List<_i7.PageRouteInfo>? children})
    : super(LoginScreenRoute.name, initialChildren: children);

  static const String name = 'LoginScreenRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return _i7.DeferredWidget(_i5.loadLibrary, () => _i5.LoginScreen());
    },
  );
}

/// generated route for
/// [_i6.RegistrationScreen]
class RegistrationScreenRoute extends _i7.PageRouteInfo<void> {
  const RegistrationScreenRoute({List<_i7.PageRouteInfo>? children})
    : super(RegistrationScreenRoute.name, initialChildren: children);

  static const String name = 'RegistrationScreenRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return _i7.DeferredWidget(
        _i6.loadLibrary,
        () => _i6.RegistrationScreen(),
      );
    },
  );
}
