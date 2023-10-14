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

