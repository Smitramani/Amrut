import 'package:amrut/pages/card_detail.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                color: const Color(0xFF243F49),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 55),
                child: Marquee(
                  text: 'Some sample text that takes some space.',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  blankSpace: 20.0,
                  velocity: 100.0,
                  pauseAfterRound: const Duration(seconds: 1),
                  startPadding: 10.0,
                  accelerationDuration: const Duration(seconds: 1),
                  accelerationCurve: Curves.linear,
                  decelerationDuration: const Duration(milliseconds: 500),
                  decelerationCurve: Curves.easeOut,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 230),
                child: Container(
                  height: 500,
                  width: double.infinity,
                  color: const Color(0xFFAECCC2),
                  alignment: Alignment.center,
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
              Padding(
                padding: const EdgeInsets.only(top: 320, left: 5),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    const Text("Customers",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color:
                                        const Color.fromARGB(255, 9, 179, 209),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 500, left: 10, right: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Services",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30)),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 0; i < 3; i++)
                            Card(
                              child: Container(
                                height: 160,
                                width: 110,
                                color: const Color.fromARGB(255, 212, 253, 49),
                              ),
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
