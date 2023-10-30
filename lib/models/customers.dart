import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final String useremail = FirebaseAuth.instance.currentUser!.email!;
var usernames = FirebaseFirestore.instance
    .collection("users")
    .doc(useremail)
    .collection("customers")
    .get("username" as GetOptions?);

class Profile {
  String date;
  String item;
  int quantity;
  double price;
  double? total;
  bool isActive;

  Profile({
    required this.date,
    required this.item,
    required this.quantity,
    required this.price,
    required this.isActive,
  }) {
    total = quantity * price;
  }
}

class UserProfile {
  String username;
  List<Profile> profiles;

  UserProfile({
    required this.username,
    required this.profiles,
  });
}

class apiServices {
  Future addUserDetails(String userName, String email) async {
    CollectionReference user = FirebaseFirestore.instance.collection('users');
    var result = await user.doc(email).set({
      "user name": userName,
      "email": email,
    });
  }

  Future addUserProfile(String customername) async {
    CollectionReference user = FirebaseFirestore.instance.collection('users');
    CollectionReference customers = user.doc(useremail).collection('customers');
    var result =
        await customers.doc(customername).set({"customer name": customername});
    return customername;
  }

  // Future addOrdersDetail() async {
  //   CollectionReference user = FirebaseFirestore.instance.collection('users');
  //   CollectionReference customers = user.doc(useremail).collection('customers');
  //   CollectionReference orders =
  //       customers.doc(usernames as String?).collection('orders');
  //   var result = orders.doc(usernames as String?).set({"item":"q2", "quentity": "10", "price": "100", "active": true});
  // }
}
