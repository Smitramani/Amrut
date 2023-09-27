import 'package:flutter/material.dart';

class custinputscreen extends StatelessWidget {
  const custinputscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('user details')),
      body: SizedBox(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'enter cust name',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'enter cust GST No.',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'enter items',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'enter No. of spits ',
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Submit")),
                Padding(padding: EdgeInsets.all(10)),
                ElevatedButton(onPressed: () {}, child: Text("Cancel")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
