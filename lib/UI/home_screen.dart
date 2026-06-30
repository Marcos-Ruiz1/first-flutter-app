import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0A1929),
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) => _buildSmokeEffect(),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmokeEffect() {
    final t = _controller.value;
    final wave = math.sin(t * math.pi);

    return Stack(
      children: [
        // Horizontal wind sweep
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 300,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(wave * 0.6 - 0.3, 1.0),
                end: Alignment(wave * 0.6 + 0.3, 0.0),
                colors: [
                  const Color(0xFFC850C0).withValues(alpha: 0.45),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        // Radial smoke puff
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 250,
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0.5 + wave * 0.25, 1.3),
                radius: 0.7 + wave * 0.15,
                colors: [
                  const Color(0xFFC850C0).withValues(alpha: 0.3),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        // Blur diffusion
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 200,
          child: ClipRect(
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(color: Colors.transparent),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildButton() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0A1929),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: const Color(0xFFC850C0),
          width: 2,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            print("button pressed");
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Start",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
