import 'package:flutter/material.dart';

class allcustdetailesscreen extends StatefulWidget {
  const allcustdetailesscreen({super.key});

  @override
  State<allcustdetailesscreen> createState() => _allcustdetailesscreenState();
}

class _allcustdetailesscreenState extends State<allcustdetailesscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Customber'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            for (int i = 0; i < 5; i++)
              Card(
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: Text('Customer Name')),
                            //Text('Cat Name'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
