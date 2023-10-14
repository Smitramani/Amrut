import 'package:amrut/models/customers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:amrut/pages/card_detail.dart';
import 'package:amrut/pages/customer_profiles.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List<UserProfile> userProfiles = [];
  final TextEditingController _usernameController = TextEditingController();

  void _addProfile(String username) {
    bool userExists = userProfiles.any((user) => user.username == username);

    if (userExists) {
      _showUserExistsDialog();
    } else {
      final userProfile = UserProfile(username: username, profiles: []);
      setState(() {
        userProfiles.add(userProfile);
      });
      Navigator.of(context).pop(); // Close the dialog
      _navigateToProfilesPage(context); // Navigate to Profiles page
    }
  }

  Future<void> _showUserExistsDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('User Already Exists'),
          content: Text('A user with the same username already exists.'),
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

  Future<void> _showDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter your username:'),
          content: TextField(
            controller: _usernameController,
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Create Profile'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => ProfilesPage(
                            userProfiles: userProfiles)))); // Close the dialog
                _addProfile(_usernameController.text);
              },
            ),
          ],
        );
      },
    );
  }

  void _navigateToProfilesPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilesPage(userProfiles: userProfiles),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xFF243F49),
        child: Stack(
          children: [
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.deepPurple,
              child: Text("sign out"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 55),
              child: Marquee(
                text:
                    '⭐Every problem is a gift-without problems we would not grow.⭐',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                blankSpace: 20.0,
                velocity: 100.0,
                pauseAfterRound: const Duration(milliseconds: 2000),
                startPadding: 10.0,
                accelerationDuration: const Duration(milliseconds: 1000),
                accelerationCurve: Curves.linear,
                decelerationDuration: const Duration(milliseconds: 500),
                decelerationCurve: Curves.easeOut,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 230),
              child: Container(
                height: 450,
                width: double.infinity,
                color: const Color(0xFFAECCC2),
                child: Padding(
                  padding: const EdgeInsets.only(top: 85, left: 5),
                  child: Stack(
                    children: [
                      TextButton(
                        onPressed: () {
                          _navigateToProfilesPage(context);
                        },
                        child: Text("Customers",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.black)),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 43, left: 5), // Adjusted left padding

                                child: InkWell(
                                  onTap: () {
                                    _showDialog(context);
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.amber,
                                    radius: 30,
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 43, left: 5),
                                child: Container(
                                  height: 60,
                                  width: 300,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: userProfiles.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.all(1),
                                        child: CircleAvatar(
                                          radius: 30,
                                          child: Text(
                                              userProfiles[index].username),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 415, left: 5, right: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: null,
                        child: Text(
                          "Services",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Container(
                            height: 160,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFCDBB80),
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Data \nEntry",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 19),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Container(
                            height: 160,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFCDBB80),
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "\t\t\tBills \nGenerat",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 19),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Container(
                            height: 160,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFCDBB80),
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Invoices",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 19),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const card_detail()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 187,
                      width: 335,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/book.png'))),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
