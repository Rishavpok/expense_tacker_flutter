import 'package:expense_tracker/modals/users.dart';
import 'package:expense_tracker/features/home/pages/home_screen.dart';
import 'package:expense_tracker/services/token_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:expense_tracker/providers/login_provider.dart';
import 'package:auto_route/auto_route.dart';
import '../../../routes/app_routes.gr.dart';

@RoutePage(name: 'LoginScreenRoute', deferredLoading: true)
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _username;
  late TextEditingController _password;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  bool _obscurePassword = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _username = TextEditingController();
    _password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        final user = Users(
                          username: _username.text.trim(),
                          password: _password.text.trim(),
                        );

                        final message = await ref
                            .read(loginProvider)
                            .login(user);

                        final successMessage = 'Login successfull';
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(successMessage),
                            duration: Duration(seconds: 3),
                          ),
                        );

                        await TokenService.saveToken(message!);

                        AutoRouter.of(context).push(const HomeModuleRoute(children: [HomeScreenRoute()]));
                      } catch (e) {
                        print(e);
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(e.toString())));
                      }
                    } else {
                      setState(() {
                        _autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
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
