import 'package:amrut/pages/home_page.dart';
import 'package:flutter/material.dart';


class signupscreen extends StatelessWidget {
  const signupscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey, title: Text('Sign Up')),
      backgroundColor: Color(0xFFD9D9D9),
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  label: Text('Enter Name...'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              TextField(
                decoration: InputDecoration(
                  label: Text('Enter E-Mail...'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              TextField(
                decoration: InputDecoration(
                  label: Text('Enter Password...'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              TextField(
                decoration: InputDecoration(
                  label: Text('Enter Re-Password...'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => homeScreen()),
                    );
                  },
                  child: Text('Sign in'))
            ],
          ),
        ),
      ),
    );
  }
}
