import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login Page'),
      ),
      body: const MyCustomFormLogin(),
    );
  }
}

class MyCustomFormLogin extends StatefulWidget {
  const MyCustomFormLogin({super.key});

  @override
  State<MyCustomFormLogin> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomFormLogin> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter E-mail id',
                ),
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter Password',
                ),
              ),
            ),
            TextButton(
              child: const Text('Login'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
