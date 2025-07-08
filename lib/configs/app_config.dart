class Environment {
  static const bool isProduction = bool.fromEnvironment('dart.vm.product');

  static const String environmentURL = String.fromEnvironment(
    'ENVIRONMENT_URL',
    defaultValue: 'http://localhost:3000/api/',
  );

  static String get apiBaseUrl => isProduction ? '' : environmentURL;
}
