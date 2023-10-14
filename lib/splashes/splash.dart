// import 'package:amrut/splashes/splash2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';


// class SequenceExample extends StatefulWidget {
//   const SequenceExample({Key? key}) : super(key: key);

//   @override
//   State<SequenceExample> createState() => _SequenceExampleState();
// }

// class _SequenceExampleState extends State<SequenceExample>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late SequenceAnimation sequenceAnimation;

//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 10), // Set the animation duration
//     );

//     // Listen for animation completion
//     controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         _navigatetohome();
//       }
//     });

//     sequenceAnimation = SequenceAnimationBuilder()
//         .addAnimatable(
//           from: Duration(milliseconds: 1000),
//           to: Duration(milliseconds: 8000),
//           tag: 'size',
//           animatable: Tween<double>(begin: 50, end: 100),
//           curve: Curves.easeInOut,
//         )
//         .addAnimatable(
//           from: Duration(milliseconds: 1000),
//           to: Duration(milliseconds: 2000),
//           tag: 'turns',
//           animatable: Tween<double>(begin: 0, end: 0.13),
//           curve: Curves.easeInOut,
//         )
//         .addAnimatable(
//           from: Duration(milliseconds: 7000),
//           to: Duration(milliseconds: 9000),
//           tag: 'circle',
//           animatable: BorderRadiusTween(
//               begin: BorderRadius.circular(10),
//               end: BorderRadius.circular(100)),
//           curve: Curves.easeInOut,
//         )
//         .addAnimatable(
//           from: Duration(milliseconds: 7000),
//           to: Duration(milliseconds: 9000),
//           tag: 'boxX',
//           animatable: Tween<double>(begin: 0, end: 0.85),
//           curve: Curves.easeInOut,
//         )
//         .addAnimatable(
//           from: Duration(milliseconds: 8000),
//           to: Duration(milliseconds: 9000),
//           tag: 'size',
//           animatable: Tween<double>(begin: 50, end: 30),
//           curve: Curves.easeInOut,
//         )
//         .animate(controller);

//     controller.forward();
//   }

//   void _navigatetohome() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => SequenceExample2()),
//     );
//   }

//   @override
//   void dispose() {
//     controller.dispose(); // Dispose the controller to avoid memory leaks
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Color(0xFF8981BA),
//         padding: EdgeInsets.all(0),
//         child: Center(
//           child: AnimatedBuilder(
//               animation: controller,
//               builder: (BuildContext context, Widget? child) {
//                 return AnimatedContainer(
//                   duration: Duration(seconds: 1),
//                   alignment: Alignment(sequenceAnimation['boxX'].value, 0),
//                   child: AnimatedRotation(
//                     turns: sequenceAnimation['turns'].value,
//                     duration: Duration(seconds: 2),
//                     child: Container(
//                       height: sequenceAnimation['size'].value,
//                       width: sequenceAnimation['size'].value,
//                       decoration: BoxDecoration(
//                           borderRadius: sequenceAnimation['circle'].value,
//                           image: DecorationImage(
//                               image: AssetImage('assets/images/Shape1.png'),
//                               fit: BoxFit.cover)),
//                     ),
//                   ),
//                 );
//               }),
//         ),
//       ),
//     );
//   }
// }
