// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, sort_child_properties_last

import 'package:firebase/apiscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>(); //key for form
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[10],
        body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text("signed in as: " + user.email!)),
              MaterialButton(
                  color: Colors.deepPurpleAccent,
                  child: Text(
                    "sign out",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: (() {
                    FirebaseAuth.instance.signOut();
                  })),
              SizedBox(height: 40),
              // text form field for name
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "name",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || !RegExp('[a-zA-Z]').hasMatch(value)) {
                      return "enter valid name";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 30),

              // text form field for age

              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "age",
                    prefixIcon: Icon(Icons.numbers),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || !RegExp('[0-9]').hasMatch(value)) {
                      return "enter valid age";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 30),

              //text form field for phone number

              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "phone number",
                    prefixIcon: Icon(Icons.phone_android),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'(^(?:[+0]9)?[0-9]{10}$)').hasMatch(value)) {
                      return "enter valid phone number";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 30),

              //text form field for dob

              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "date Of birth (dd/mm/yy)",
                    prefixIcon: Icon(Icons.calendar_month_rounded),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$")
                            .hasMatch(value)) {
                      return "enter valid date of birth";
                    } else {
                      return null;
                    }
                  },
                ),
              ),

              // submit button
              SizedBox(height: 40),
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.deepPurple[500])),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return ApiScreen();
                        }));
                      }
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ));
  }
}
