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
  final usernameController = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String errorMessage = '';

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    confirmPasswordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  void register() async {
    if (passwordcontroller.text != confirmPasswordController.text) {
      setState(() {
        errorMessage = 'Passwords do not match';
      });
      return;
    }
    try {

      showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        },
      );

      await authService.value.signin(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );

      Navigator.of(context).pop();
      // Set display name (username)
      await FirebaseAuth.instance.currentUser!.updateDisplayName(
        usernameController.text,
      );

      // Update the user display name
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => home()),
      );
    } on FirebaseAuthException catch (e) {
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
                  controller: usernameController,
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
                  controller: emailcontroller,
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
                  controller: passwordcontroller,
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
                  controller: confirmPasswordController,
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
