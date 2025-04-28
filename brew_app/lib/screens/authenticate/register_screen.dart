import 'package:brew_app/models/user.dart';
import 'package:brew_app/services/auth_service.dart';
import 'package:brew_app/shared/loading.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _auth = AuthService();
  final _registerFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String error = '';
  bool loading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingWidget()
        : Scaffold(
          backgroundColor: Colors.brown[100],
          appBar: AppBar(
            title: const Text(
              'Sign Up to Brew App',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Form(
            key: _registerFormKey,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0.0,
                    horizontal: 20.0,
                  ),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0.0,
                    horizontal: 20.0,
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator:
                        (val) =>
                            val!.length < 6
                                ? 'Enter a Password with 6+ characters'
                                : null,
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_registerFormKey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                      });

                      String email = emailController.text;
                      String password = passwordController.text;
                      UserAuthModel? user = await _auth
                          .registerWithEmailAndPassword(email, password);

                      if (user == null) {
                        setState(() {
                          error = 'Please supply a valid email';
                          loading = false;
                        });
                      } else {
                        setState(() {
                          error = '';
                          loading = false;
                        });
                      }

                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Register'),
                ),
                const SizedBox(height: 20.0),
                Text(error, style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        );
  }
}
