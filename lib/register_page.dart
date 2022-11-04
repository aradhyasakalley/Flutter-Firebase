// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isPassHidden = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Future signUp() async {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // welcome text
            Text(
              'New Here?',
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 60,
              ),
            ),
            //text more
            SizedBox(height: 20),
            Text(
              'register with your email',
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
                  border: Border.all(color: Colors.black),
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
                  border: Border.all(color: Colors.black),
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
                onTap: signUp,
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      "sign up ",
                      style: TextStyle(color: Colors.white),
                    ))),
              ),
            ),

            //bottom text

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("already a member? "),
                GestureDetector(
                  onTap: widget.showLoginPage,
                  child: Text(
                    "login now",
                    style: TextStyle(color: Colors.deepPurple[800]),
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
