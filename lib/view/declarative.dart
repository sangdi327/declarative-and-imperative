import 'package:flutter/material.dart';

class Declarative extends StatefulWidget {
  const Declarative({super.key});

  @override
  State<Declarative> createState() => _DeclarativeState();
}

class _DeclarativeState extends State<Declarative>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  double leftPosition = 0.0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    animation = Tween(begin: 0.0, end: 300.0).animate(animationController)
      ..addListener(() {
        setState(() {
          leftPosition = animation.value;
        });
      });
    startAnimation();
  }

  void startAnimation() {
    if (animationController.status == AnimationStatus.completed) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('declarative method'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
              left: leftPosition,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.deepOrange,
              )),
        ],
      ),
    );
  }
}
