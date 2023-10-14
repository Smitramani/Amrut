import 'package:amrut/pages/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signupscreen extends StatefulWidget {
  final VoidCallback showLoginScreen;
  const signupscreen({super.key, required this.showLoginScreen});

  @override
  State<signupscreen> createState() => _signupscreenState();
}

class _signupscreenState extends State<signupscreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _usernameController = TextEditingController();

  Future SignUp() async {
    //create user
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());

      //add user details
      addUserDetails(
        _usernameController.text.trim(),
        _emailController.text.trim(),
      );
    }
  }

  Future addUserDetails(String userName, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      "user name": userName,
      "email": email,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _confirmpasswordController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey, title: Text('Sign Up')),
      backgroundColor: Color(0xFFD9D9D9),
      body: Center(
        child: SizedBox(
          height: 400,
          width: 350,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    label: Text('Enter User Name...'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    label: Text('Enter E-Mail...'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    label: Text('Enter Password...'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                TextField(
                  controller: _confirmpasswordController,
                  decoration: InputDecoration(
                    label: Text('Enter Confirm Password...'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(padding: EdgeInsets.all(15)),
                GestureDetector(
                  onTap: SignUp,
                  child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(child: Text('Sign Up'))),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('have a account ? '),
                    GestureDetector(
                      onTap: widget.showLoginScreen,
                      child: Container(
                          child: Text(
                        'Log In',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.blue),
                      )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
