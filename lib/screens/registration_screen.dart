import 'package:expense_tracker/modals/registration.dart';
import 'package:expense_tracker/providers/registration_notifier.dart';
import 'package:expense_tracker/screens/login_screen.dart';
import 'package:expense_tracker/states/registration_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({super.key});

  @override
  ConsumerState<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstname;
  late TextEditingController _lastname;
  late TextEditingController _email;
  late TextEditingController _phone;
  late TextEditingController _username;
  late TextEditingController _password;
  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    _firstname = TextEditingController();
    _lastname = TextEditingController();
    _email = TextEditingController();
    _phone = TextEditingController();
    _username = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _firstname.dispose();
    _lastname.dispose();
    _email.dispose();
    _phone.dispose();
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<RegistrationState>(registrationNotifierProvider, (
      prev,
      next,
    ) async {
      if (next is RegistrationLoading) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => const Center(child: CircularProgressIndicator()),
        );
      } else {
        // Always dismiss loading dialog before anything else
        Navigator.of(context, rootNavigator: true).pop(); // <-- dismiss dialog

        if (next is RegistrationSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration successful')),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()),
          );
        } else if (next is RegistrationError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(next.message)));
        }
      }
    });

    final registrationState = ref.watch(registrationNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Sign up')),
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
                  controller: _firstname,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: 'First name is required',
                    ),
                  ]),
                  decoration: InputDecoration(
                    labelText: 'First name',
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
                  controller: _lastname,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: 'Last name is required',
                    ),
                  ]),
                  decoration: InputDecoration(
                    labelText: 'Last name',
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
                  controller: _email,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: 'Email is required',
                    ),
                    FormBuilderValidators.email(
                      errorText: 'Enter a valid email',
                    ),
                  ]),
                  decoration: InputDecoration(
                    labelText: 'Email',
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
                  controller: _phone,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: 'Phone is required',
                    ),
                  ]),
                  decoration: InputDecoration(
                    labelText: 'Phone',
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
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: 'Password is required',
                    ),
                  ]),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed:
                      registrationState is RegistrationLoading
                          ? null
                          : handleRegister,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    'Submit',
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

  void handleRegister(){
    final user = Registration(
      firstName: _firstname.text.trim(),
      lastName: _lastname.text.trim(),
      email: _email.text.trim(),
      phone: _phone.text.trim(),
      username: _username.text.trim(),
      password: _password.text.trim(),
    );
     ref.read(registrationNotifierProvider.notifier).registration(user);
  }
}
