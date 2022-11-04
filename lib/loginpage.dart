// ignore_for_file: implementation_imports, prefer_const_constructors, prefer_const_literals_to_create_immutables, override_on_non_overriding_member, annotate_overrides

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;

  const LoginPage({super.key, required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  bool isPassHidden = true;
  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // method for signing in
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // welcome text
            Text(
              'Hello!',
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 60,
              ),
            ),
            //text more
            SizedBox(height: 20),
            Text(
              'Welcome back to the app',
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),

            //textfield for email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100],
                  border: Border.all(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Email',
                      )),
                ),
              ),
            ),
            SizedBox(height: 20),
            //textfield for password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100],
                  border: Border.all(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: isPassHidden,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Password',
                        suffixIcon: InkWell(
                            onTap: _togglePassword,
                            child: Icon(Icons.visibility))),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            //login button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: GestureDetector(
                onTap: signIn,
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      "sign in ",
                      style: TextStyle(color: Colors.white),
                    ))),
              ),
            ),

            //bottom text

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("not a member yet? "),
                GestureDetector(
                  onTap: widget.showRegisterPage,
                  child: Text(
                    "register now",
                    style: TextStyle(color: Colors.deepPurpleAccent),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _togglePassword() {
    if (isPassHidden == true) {
      isPassHidden = false;
    } else {
      isPassHidden = true;
    }
    setState(() {});
  }
}
