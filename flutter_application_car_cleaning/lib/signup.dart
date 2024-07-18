import 'package:flutter/material.dart';
import 'package:flutter_application_car_cleaning/data/firebase_service/firebase_auth.dart';
import 'package:flutter_application_car_cleaning/homepage.dart';
// import 'package:flutter_application_car_cleaning/util/dialog.dart';
// import 'package:flutter_application_car_cleaning/util/exception.dart';
// import 'package:final_project_1/login.dart';

class signup extends StatefulWidget {
  const signup({super.key});
  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up',
            style: TextStyle(color: Colors.white, fontSize: 40)),
        backgroundColor: const Color.fromRGBO(53, 114, 239, 1),
        toolbarHeight: 400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            const SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                labelStyle: TextStyle(color: Colors.blueAccent),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email address';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.blueAccent),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: TextStyle(color: Colors.blueAccent),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Please confirm your password';
                if (value != _passwordController.text)
                  return 'Password does not match';
                return null;
              },
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // Display a success message with custom color

                  await Authentication().Signup(
                      email: _emailController.text,
                      password: _passwordController.text,
                      confirm_password: _passwordController.text);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'you just signed up',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Color.fromARGB(255, 116, 7, 249),
                    ),
                  );

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const homePage()
                  ));
                }
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }
}
