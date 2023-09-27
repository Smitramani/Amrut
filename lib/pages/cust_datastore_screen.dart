import 'package:flutter/material.dart';

class custdatastorescreen extends StatelessWidget {
  final String custName;
  final String custGSTno;
  final bool orderCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  custdatastorescreen({
    super.key,
    required this.custName,
    required this.custGSTno,
    required this.orderCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Row(children: [
          Checkbox(
            value: orderCompleted,
            onChanged: onChanged,
            activeColor: Colors.black,
          ),
          Text(
            custName,
            style: TextStyle(
                decoration: orderCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          Text(
            custGSTno,
            style: TextStyle(
                decoration: orderCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
        ]),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
