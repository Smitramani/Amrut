import 'package:flutter/material.dart';

class servicesscreens extends StatelessWidget {
  const servicesscreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 100,
                width: 500,
                child: Center(child: Text('Data Entry')),
                color: Colors.grey,
              ),
              Padding(padding: EdgeInsets.all(12)),
              Container(
                height: 100,
                width: 500,
                child: Center(child: Text('Bill Generation')),
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
