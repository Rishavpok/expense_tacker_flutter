sealed class RegistrationState {}

class ResgistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationSuccess extends RegistrationState {
  final String message;
  RegistrationSuccess(this.message);
}

class RegistrationError extends RegistrationState {
  final String message;
  RegistrationError(this.message);
}
