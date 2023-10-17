import 'package:flutter/material.dart';

class Imperative extends StatelessWidget {
  const Imperative({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('imperative method'),
      ),
      body: ImperativeWidget(
        duration: const Duration(milliseconds: 1000),
        initPosition: 0.0,
        targetPosition: 200.0,
        object: Container(
          height: 100,
          width: 100,
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}

class ImperativeWidget extends StatefulWidget {
  const ImperativeWidget({
    super.key,
    required this.duration,
    required this.initPosition,
    required this.targetPosition,
    required this.object,
  });

  final Duration duration;
  final double initPosition;
  final double targetPosition;
  final Widget object;

  @override
  State<ImperativeWidget> createState() => _ImperativeWidgetState();
}

class _ImperativeWidgetState extends State<ImperativeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  double leftPosition = 0.0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    animation = Tween(begin: widget.initPosition, end: widget.targetPosition)
        .animate(animationController)
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
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          left: leftPosition,
          child: widget.object,
        ),
      ],
    );
  }
}
