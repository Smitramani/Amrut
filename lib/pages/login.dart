import 'package:amrut/pages/forgetPassword_page.dart';
import 'package:amrut/pages/home_page.dart';
import 'package:amrut/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginscreen extends StatefulWidget {
  final VoidCallback showRegisterScreen;
  const loginscreen({super.key, required this.showRegisterScreen});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  //text Controllers

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future SignIn() async {
    //loding circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      //login button func
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      //pop the loding circle
      if (context.mounted) Navigator.pop(context);
    }
    //display any errors
    on FirebaseAuthException catch (e) {
      //pop the loding circle
      Navigator.of(context).pop();
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Login'),
      ),
      backgroundColor: Color(0xFFD9D9D9),
      body: Center(
        child: SizedBox(
          height: 310,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  label: Text('Enter your email here...'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  label: Text('Enter your Password...'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ForgetPasswordPage();
                      }));
                    },
                    child: Text(
                      'Forget Password ?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.blue),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(15)),
              GestureDetector(
                onTap: SignIn,
                child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(child: Text('Log In'))),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('not a user ? '),
                  GestureDetector(
                    onTap: widget.showRegisterScreen,
                    child: Container(
                        child: Text(
                      'Sign Up',
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
    );
  }
}
