import 'package:brew_app/screens/authenticate/register_screen.dart';
import 'package:brew_app/services/auth_service.dart';
import 'package:brew_app/shared/loading.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthService _auth = AuthService();
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool loading = false;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return !loading
        ? Scaffold(
          backgroundColor: Colors.brown[100],
          appBar: AppBar(
            title: const Text(
              'Sign In to Brew App',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            actions: [
              TextButton.icon(
                icon: const Icon(Icons.person, color: Colors.white),
                label: const Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          body: Form(
            key: _loginFormKey,
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
                    onChanged: (value) => {},
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
                        (val) => val!.isEmpty ? 'Enter a Password' : null,
                    onChanged: (value) => {},
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_loginFormKey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                      });
                      bool isError = await _auth.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );

                      if (!isError) {
                        setState(() {
                          error = 'Invalid email or password';
                          loading = false;
                        });
                      } else {
                        setState(() {
                          error = '';
                          loading = false;
                        });
                      }
                    }
                  },
                  child: const Text('Sign In'),
                ),
                const SizedBox(height: 20.0),
                Text(error, style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        )
        : LoadingWidget();
  }
}
