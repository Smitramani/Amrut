import 'package:amrut/models/customers.dart';
import 'package:amrut/pages/change2.dart';
import 'package:amrut/pages/customer_profiles.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final UserProfile userProfile;

  ProfileScreen({required this.userProfile});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page for ${widget.userProfile.username}'),
      ),
      body: ListView.builder(
        itemCount: widget.userProfile.profiles.length,
        itemBuilder: (context, index) {
          final profile = widget.userProfile.profiles[index];
          return Container(
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.all(8.0),
            color: Colors.blueAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xFFCEA0DE)),
                  child: Text(
                    'Date: ${profile.date}',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Item: ${profile.item}',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'Quantity: ${profile.quantity}',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'Price: RS.${profile.price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'Total: RS.${profile.total!.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  AddProfilePage(userProfile: widget.userProfile),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
