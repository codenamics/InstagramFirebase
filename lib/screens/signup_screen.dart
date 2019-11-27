import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  static final String routeName = 'signup-screen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
    final _formKey = GlobalKey<FormState>();
    String _name;
  String _email;
  String _password;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Instagram',
              style: TextStyle(fontSize: 50, fontFamily: 'Billabong'),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                   Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: TextFormField(
                      onSaved: (input) => _name = input,
                      validator: (input) => input.trim().isEmpty
                          ? 'Please enter name'
                          : null,
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: TextFormField(
                      onSaved: (input) => _email = input,
                      validator: (input) => !input.contains('@')
                          ? 'Please enter valid email'
                          : null,
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: TextFormField(
                      onSaved: (input) => _password = input,
                      validator: (input) =>
                          input.trim().isEmpty ? 'Password is missing' : null,
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    width: double.infinity,
                    child: FlatButton(
                      onPressed: _submit,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    width: double.infinity,
                    child: FlatButton(
                      onPressed: () =>
                          Navigator.pop(context, LoginScreen.routeName),
                      child: Text(
                        'Go to Login',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}