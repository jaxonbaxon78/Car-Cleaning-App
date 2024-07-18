import 'package:flutter_application_car_cleaning/data/firebase_service/firebase_auth.dart';
import 'package:flutter_application_car_cleaning/homepage.dart';
import 'package:flutter_application_car_cleaning/signup.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});
  @override
  State<login> createState() => _loginState();
}
class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }
/*
  void _login() {
    if (_formKey.currentState!.validate()) {
      // Display a success message with custom color
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'you just logged in',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromRGBO(53, 114, 239, 1),
        ),
      );
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome', style: TextStyle(color: Colors.white, fontSize: 40)),
        backgroundColor: const Color.fromRGBO(53, 114, 239, 1),
        toolbarHeight: 400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                cursorColor: const Color.fromRGBO(53, 114, 239, 1),
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: const Color.fromRGBO(53, 114, 239, 1)),
                  ),
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
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                cursorColor: const Color.fromRGBO(53, 114, 239, 1),
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: const Color.fromRGBO(53, 114, 239, 1)),
                  ),
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
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {

                    await Authentication().Login(
                      email: _emailController.text, 
                      password: _passwordController.text);
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'you just logged in',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Color.fromARGB(255, 116, 7, 249),
                    ),
                  );

                  Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => homePage()
                  ));
                }
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () async {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => signup()
                  ));
                },
                child: const Text('Don\'t have an account? Sign up'),
              )
            ]
          ),
        ),
      ),
    );
  }
}