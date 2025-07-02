import 'package:expense_tracker/modals/users.dart';
import 'package:expense_tracker/providers/login_notifier.dart';
import 'package:expense_tracker/screens/home_screen.dart';
import 'package:expense_tracker/services/token_service.dart';
import 'package:expense_tracker/states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _username;
  late TextEditingController _password;
  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();

    _username = TextEditingController();
    _password = TextEditingController();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      final user = Users(
        username: _username.text.trim(),
        password: _password.text.trim(),
      );

      ref.read(loginNotifierProvider.notifier).login(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<LoginState>(loginNotifierProvider, (prev, next) async {
      if (next is LoginLoading) {
        showDialog(
          context: context,
          barrierDismissible: false, // prevent user from closing
          builder: (_) {
            return const Center(child: CircularProgressIndicator());
          },
        );
      } else if (next is LoginSuccess) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Login successful')));

        await TokenService.saveToken(next.token);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      } else if (next is LoginError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.message)));
      }
    });

    final loginState = ref.watch(loginNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TextFormField(
                  controller: _username,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: 'Username is required',
                    ),
                  ]),
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TextFormField(
                  controller: _password,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: 'Password is required',
                    ),
                  ]),
                ),
              ),

              SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: loginState is LoginLoading ? null : _handleLogin,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
