// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:expense_tracker/features/authentication/authentication_module.dart'
    deferred as _i1;
import 'package:expense_tracker/features/authentication/pages/login_screen.dart'
    deferred as _i5;
import 'package:expense_tracker/features/authentication/pages/registration_screen.dart'
    deferred as _i7;
import 'package:expense_tracker/features/home/home_module.dart' deferred as _i2;
import 'package:expense_tracker/features/home/pages/home_screen.dart'
    deferred as _i3;
import 'package:expense_tracker/screens/intro_screen.dart' deferred as _i4;
import 'package:expense_tracker/screens/product_details_screen.dart'
    deferred as _i6;
import 'package:flutter/material.dart' as _i9;

/// generated route for
/// [_i1.AuthenticationModule]
class AuthenticationModuleRoute extends _i8.PageRouteInfo<void> {
  const AuthenticationModuleRoute({List<_i8.PageRouteInfo>? children})
    : super(AuthenticationModuleRoute.name, initialChildren: children);

  static const String name = 'AuthenticationModuleRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i8.DeferredWidget(
        _i1.loadLibrary,
        () => _i1.AuthenticationModule(),
      );
    },
  );
}

/// generated route for
/// [_i2.HomeModule]
class HomeModuleRoute extends _i8.PageRouteInfo<void> {
  const HomeModuleRoute({List<_i8.PageRouteInfo>? children})
    : super(HomeModuleRoute.name, initialChildren: children);

  static const String name = 'HomeModuleRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i8.DeferredWidget(_i2.loadLibrary, () => _i2.HomeModule());
    },
  );
}

/// generated route for
/// [_i3.HomeScreen]
class HomeScreenRoute extends _i8.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i8.PageRouteInfo>? children})
    : super(HomeScreenRoute.name, initialChildren: children);

  static const String name = 'HomeScreenRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i8.DeferredWidget(_i3.loadLibrary, () => _i3.HomeScreen());
    },
  );
}

/// generated route for
/// [_i4.IntroScreen]
class IntroScreenRoute extends _i8.PageRouteInfo<void> {
  const IntroScreenRoute({List<_i8.PageRouteInfo>? children})
    : super(IntroScreenRoute.name, initialChildren: children);

  static const String name = 'IntroScreenRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i8.DeferredWidget(_i4.loadLibrary, () => _i4.IntroScreen());
    },
  );
}

/// generated route for
/// [_i5.LoginScreen]
class LoginScreenRoute extends _i8.PageRouteInfo<void> {
  const LoginScreenRoute({List<_i8.PageRouteInfo>? children})
    : super(LoginScreenRoute.name, initialChildren: children);

  static const String name = 'LoginScreenRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i8.DeferredWidget(_i5.loadLibrary, () => _i5.LoginScreen());
    },
  );
}

/// generated route for
/// [_i6.ProductDetailsPage]
class ProductDetailsScreenRoute
    extends _i8.PageRouteInfo<ProductDetailsScreenRouteArgs> {
  ProductDetailsScreenRoute({
    _i9.Key? key,
    required String productId,
    required String name,
    required String price,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         ProductDetailsScreenRoute.name,
         args: ProductDetailsScreenRouteArgs(
           key: key,
           productId: productId,
           name: name,
           price: price,
         ),
         initialChildren: children,
       );

  static const String name = 'ProductDetailsScreenRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsScreenRouteArgs>();
      return _i8.DeferredWidget(
        _i6.loadLibrary,
        () => _i6.ProductDetailsPage(
          key: args.key,
          productId: args.productId,
          name: args.name,
          price: args.price,
        ),
      );
    },
  );
}

class ProductDetailsScreenRouteArgs {
  const ProductDetailsScreenRouteArgs({
    this.key,
    required this.productId,
    required this.name,
    required this.price,
  });

  final _i9.Key? key;

  final String productId;

  final String name;

  final String price;

  @override
  String toString() {
    return 'ProductDetailsScreenRouteArgs{key: $key, productId: $productId, name: $name, price: $price}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductDetailsScreenRouteArgs) return false;
    return key == other.key &&
        productId == other.productId &&
        name == other.name &&
        price == other.price;
  }

  @override
  int get hashCode =>
      key.hashCode ^ productId.hashCode ^ name.hashCode ^ price.hashCode;
}

/// generated route for
/// [_i7.RegistrationScreen]
class RegistrationScreenRoute extends _i8.PageRouteInfo<void> {
  const RegistrationScreenRoute({List<_i8.PageRouteInfo>? children})
    : super(RegistrationScreenRoute.name, initialChildren: children);

  static const String name = 'RegistrationScreenRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i8.DeferredWidget(
        _i7.loadLibrary,
        () => _i7.RegistrationScreen(),
      );
    },
  );
}
