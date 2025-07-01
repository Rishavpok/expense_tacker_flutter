import 'package:expense_tracker/providers/login_provider.dart';
import 'package:expense_tracker/states/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_tracker/modals/users.dart';

final loginNotifierProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(ref),
);

class LoginNotifier extends StateNotifier<LoginState> {
  final Ref ref;

  LoginNotifier(this.ref) : super(LoginInitial());


  Future<void> login(Users user) async {
    state = LoginLoading();

    try {
      final loginService = ref.read(
        loginProvider,
      );
      final token = await loginService.login(user);

      state = LoginSuccess(token!);
    } catch (e) {
      state = LoginError(e.toString().replaceFirst("Exception: ", ""));
    }
  }
}
