import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlassBox extends StatelessWidget {
  const FrostedGlassBox({
    super.key,
    required this.theChild,
  });

  final theChild;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            //Blur Effect
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4.0,
                sigmaY: 4.0,
              ),
              child: Container(),
            ),
            //Gradent Effect
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white.withOpacity(0.33)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.40),
                        Colors.white.withOpacity(0.25)
                      ])),
            ),
            //Child
            Center(child: theChild),
          ],
        ),
      ),
    );
  }
}
