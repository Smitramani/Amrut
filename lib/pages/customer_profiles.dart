import 'package:amrut/models/customers.dart';
import 'package:amrut/pages/change1.dart';
import 'package:amrut/pages/change2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProfilesPage extends StatefulWidget {
  final List<UserProfile> userProfiles;

  ProfilesPage({required this.userProfiles});

  @override
  _ProfilesPageState createState() => _ProfilesPageState();
}

class _ProfilesPageState extends State<ProfilesPage> {
  String _searchQuery = '';

  void _deleteProfile(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this profile?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                setState(() {
                  widget.userProfiles.removeAt(index);
                });
                Navigator.of(context).pop(); // Close the confirmation dialog
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showAddUserDialog(BuildContext context) async {
    final TextEditingController _newUsernameController =
        TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New User'),
          content: TextField(
            controller: _newUsernameController,
            decoration: InputDecoration(labelText: 'Username'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                final newUsername = _newUsernameController.text;
                bool userExists = widget.userProfiles
                    .any((userProfile) => userProfile.username == newUsername);

                if (userExists) {
                  // User with the same name already exists
                  Navigator.of(context).pop(); // Close the dialog
                  _showUserExistsDialog(context);
                } else {
                  Navigator.of(context).pop(); // Close the dialog
                  if (newUsername.isNotEmpty) {
                    final newUserProfile = UserProfile(
                      username: newUsername,
                      profiles: [],
                    );
                    setState(() {
                      widget.userProfiles.add(newUserProfile);
                    });
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showUserExistsDialog(BuildContext context) async {
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

  @override
  Widget build(BuildContext context) {
    List<UserProfile> filteredProfiles = widget.userProfiles
        .where((profile) =>
            profile.username.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Profiles Page'),
      ),
      body: Container(
        color: Color(0xFFAECCC2),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFB38D8D)),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Search by Username',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xFFC84A4A),
                    ),
                    child: TextButton(
                      onPressed: () {
                        _showAddUserDialog(context);
                      },
                      child: Text(
                        'Add User',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredProfiles.length,
                itemBuilder: (context, index) {
                  final userProfile = filteredProfiles[index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFCEA0DE),
                      ),
                      child: Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        child: ListTile(
                          title: Text(userProfile.username),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProfileScreen(userProfile: userProfile),
                              ),
                            );
                          },
                        ),
                        secondaryActions: [
                          IconSlideAction(
                            caption: 'Delete',
                            color: Colors.red,
                            icon: Icons.delete,
                            onTap: () => _deleteProfile(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
