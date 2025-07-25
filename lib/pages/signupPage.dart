import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoe_store/services/auth_service.dart';
import 'package:shoe_store/services/auth_service.dart';

import '../home.dart';

class signupPage extends StatefulWidget {
  const signupPage({super.key});

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  @override
  final _usernameController = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String errorMessage = '';

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _confirmPasswordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  void register() async {
    if (_passwordcontroller.text.trim() != _confirmPasswordController.text.trim()) {
      setState(() {
        errorMessage = 'Passwords do not match';
      });
      return;
    }

    Future addUserDetail(String username, String email, String password) async {
      await FirebaseFirestore.instance.collection('shoes').add({
        'username': username,
        'email': email,
        'password': password,
      });
    }

    await addUserDetail(
      _usernameController.text.trim(),
      _emailcontroller.text.trim(),
      _passwordcontroller.text.trim(),
    );

    try {
      showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
      );
      await authService.value.signup(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim(),
      );


      Navigator.pop(context);
      // Update the user display name
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => home()),
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      setState(() {
        errorMessage = e.message ?? 'Registration failed';
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(backgroundColor: Colors.grey[200]),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 42,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "Fuel your drive with quality kicks",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.grey[500],
                  ),
                ),
              ),

              SizedBox(height: 30),

              SizedBox(
                width: 300,
                child: TextField(
                  controller: _usernameController,
                  keyboardType: TextInputType.name,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    hintText: 'Username',
                    hintStyle: TextStyle(color: Colors.grey.shade600),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              SizedBox(
                width: 300,
                child: TextField(
                  controller: _emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey.shade600),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              SizedBox(
                width: 300,
                child: TextField(
                  controller: _passwordcontroller,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey.shade600),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              SizedBox(
                width: 300,
                child: TextField(
                  controller: _confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(color: Colors.grey.shade600),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),

              Text(errorMessage, style: TextStyle(color: Colors.red)),

              SizedBox(height: 4),

              GestureDetector(
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => home()),
                    ),
                child: SizedBox(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 18),

              GestureDetector(
                onTap: register,
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: 200,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black,
                  ),
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
