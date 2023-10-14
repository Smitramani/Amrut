import 'package:amrut/models/customers.dart';
import 'package:amrut/models/frostedglass.dart';
import 'package:amrut/pages/change2.dart';
import 'package:amrut/pages/customer_profiles.dart';
import 'package:amrut/pages/home_page.dart';
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Order\'s of ${widget.userProfile.username}'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: Color(0xFFAECCC2),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Rectangle 29.png')),
                    color: Color(0xFFCEA0DE),
                    borderRadius: BorderRadius.circular(40)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 115, right: 115),
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 60,
                  child: Text('${widget.userProfile.username}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Container(
                  height: 400,
                  child: ListView.builder(
                    itemCount: widget.userProfile.profiles.length,
                    itemBuilder: (context, index) {
                      final profile = widget.userProfile.profiles[index];
                      return FrostedGlassBox(
                        theChild: Container(
                          padding: EdgeInsets.all(16.0),
                          margin: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date: ${profile.date}',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Item: ${profile.item}',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Quantity: ${profile.quantity}',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Price: \$${profile.price.toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Total: \$${profile.total!.toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              SizedBox(height: 10),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.start,

                                children: [
                                  Text(
                                    'Active: ',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  Checkbox(
                                    value: profile.isActive,
                                    onChanged: null,
                                    activeColor: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
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
