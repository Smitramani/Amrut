import 'package:amrut/pages/home_page.dart';
import 'package:amrut/pages/signup.dart';
import 'package:flutter/material.dart';


class loginscreen extends StatelessWidget {
  const loginscreen({super.key});

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
          height: 300,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  label: Text('Enter your email here...'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              TextField(
                decoration: InputDecoration(
                  label: Text('Enter your Password...'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(15)),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => homeScreen()),
                        );
                      },
                      child: Text('Login')),
                  Padding(padding: EdgeInsets.all(15)),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => signupscreen()),
                        );
                      },
                      child: Text('Sign up'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
