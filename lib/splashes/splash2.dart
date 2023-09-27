import 'package:amrut/pages/home_page.dart';
import 'package:amrut/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SequenceExample2 extends StatefulWidget {
  const SequenceExample2({Key? key}) : super(key: key);

  @override
  State<SequenceExample2> createState() => _SequenceExample2State();
}

class _SequenceExample2State extends State<SequenceExample2>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late SequenceAnimation sequenceAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigatetoHome();
      }
    });

    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
          from: const Duration(milliseconds: 1000),
          to: const Duration(milliseconds: 2000),
          tag: 'turns',
          animatable: Tween<double>(begin: 0.13, end: 0),
          curve: Curves.easeInOut,
        )
        .addAnimatable(
          from: const Duration(milliseconds: 3000),
          to: const Duration(milliseconds: 4000),
          tag: 'circle',
          animatable: BorderRadiusTween(
              begin: BorderRadius.circular(100), end: BorderRadius.circular(0)),
          curve: Curves.easeInOut,
        )
        .addAnimatable(
          from: const Duration(milliseconds: 1000),
          to: const Duration(milliseconds: 4000),
          tag: 'size',
          animatable: Tween<double>(begin: 30, end: 900),
          curve: Curves.easeInOut,
        )
        .animate(controller);
    controller.forward();
  }

  void _navigatetoHome() {
    // Navigate to the desired screen when the animation is complete
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              const loginscreen()), // Replace with your desired screen
    );
  }

  @override
  void dispose() {
    controller.dispose(); // Dispose the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF8981BA),
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Center(
              child: AnimatedBuilder(
                animation: controller,
                builder: (BuildContext context, Widget? child) {
                  return AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    alignment: const Alignment(0.85, 0),
                    child: AnimatedRotation(
                      turns: sequenceAnimation['turns'].value,
                      duration: const Duration(seconds: 2),
                      child: Container(
                        height: sequenceAnimation['size'].value,
                        width: sequenceAnimation['size'].value,
                        decoration: BoxDecoration(
                          borderRadius: sequenceAnimation['circle'].value,
                          image: const DecorationImage(
                            image: AssetImage('assets/images/Shape1.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'AMRUT',
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                    ),
                    curve: Curves.easeInOut,
                    speed: const Duration(milliseconds: 200),
                  ),
                ],
                totalRepeatCount: 1,
                pause: const Duration(milliseconds: 100),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
