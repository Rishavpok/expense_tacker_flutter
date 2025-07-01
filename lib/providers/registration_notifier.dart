import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_tracker/states/registration_state.dart';
import 'package:expense_tracker/modals/registration.dart';
import 'package:expense_tracker/providers/registration_provider.dart';

final registrationNotifierProvider =
    StateNotifierProvider<RegistrationNotifier, RegistrationState>(
      (ref) => RegistrationNotifier(ref),
    );

class RegistrationNotifier extends StateNotifier<RegistrationState> {
  final Ref ref;

  RegistrationNotifier(this.ref) : super(ResgistrationInitial());

  Future<void> registration(Registration user) async {
    state = RegistrationLoading();
    try {
      final registrationService = ref.read(registrationProvider);

      final response = await registrationService.register(user);

      state = RegistrationSuccess(response);
    } catch (e) {
      state = RegistrationError(e.toString().replaceFirst("Exception: ", ""));
    }
  }
}
