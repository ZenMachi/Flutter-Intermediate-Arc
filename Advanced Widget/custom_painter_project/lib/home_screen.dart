import 'package:custom_painter_project/animations/loader_animation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen>
    with TickerProviderStateMixin {
  late AnimationController loaderController;
  late Animation<double> loaderAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaderController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    loaderAnimation = Tween(begin: 1.0, end: 1.4).animate(
      CurvedAnimation(parent: loaderController, curve: Curves.easeIn),
    );
    loaderController.repeat(reverse: true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    loaderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
            animation: loaderAnimation,
            builder: (context, child) {
              return Transform.rotate(
                angle: loaderAnimation.status == AnimationStatus.forward
                    ? (math.pi * 2) * loaderController.value
                    : -(math.pi * 2) * loaderController.value,
                child: CustomPaint(
                  foregroundPainter: LoaderAnimation(
                    radiusRatio: loaderAnimation.value,
                  ),
                  size: Size(300, 300),
                ),
              );
            }),
      ),
    );
  }
}
