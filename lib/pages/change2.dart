import 'package:amrut/models/customers.dart';
import 'package:amrut/pages/customer_profiles.dart';
import 'package:amrut/pages/home_page.dart';
import 'package:flutter/material.dart';


class AddProfilePage extends StatefulWidget {
  final UserProfile userProfile;

  AddProfilePage({required this.userProfile});

  @override
  _AddProfilePageState createState() => _AddProfilePageState();
}

class _AddProfilePageState extends State<AddProfilePage> {
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  bool _isActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _itemController,
              decoration: InputDecoration(labelText: 'Item'),
            ),
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Quantity'),
            ),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            Row(
              children: [
                Text('Active:'),
                Checkbox(
                  value: _isActive,
                  onChanged: (value) {
                    setState(() {
                      _isActive = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final date = DateTime.now().toString();
                final item = _itemController.text;
                final quantity = int.tryParse(_quantityController.text) ?? 0;
                final price = double.tryParse(_priceController.text) ?? 0.0;

                final newProfile = Profile(
                  date: date,
                  item: item,
                  quantity: quantity,
                  price: price,
                  isActive: _isActive,
                );

                widget.userProfile.profiles.add(newProfile);

                Navigator.pop(context);
              },
              child: Text('Add Data'),
            ),
          ],
        ),
      ),
    );
  }
}
