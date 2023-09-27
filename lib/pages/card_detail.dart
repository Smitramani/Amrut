import 'package:flutter/material.dart';

class card_detail extends StatelessWidget {
  const card_detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          // child: Image.asset('assets/images/Shape3.png')
          decoration: const BoxDecoration(color: Color(0xFFB73E4B)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 160),
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Rectangle 20.png'),
                    fit: BoxFit.cover)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 125, left: 25, right: 25),
          child: Container(
            height: 209,
            width: 339,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage('assets/images/digital_card.png'),
                    fit: BoxFit.cover)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 375, left: 10, right: 10),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                color: const Color(0xFFAECCC2),
                borderRadius: BorderRadius.circular(10)),
          ),
        )
      ]),
    );
  }
}
